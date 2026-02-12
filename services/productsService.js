const axios = require("axios");
const db = require("../db");
const TAPAZ_PLATFORM_ID = 1;

/**
 * Utility to create a random delay between requests.
 * Minimizes the risk of being flagged as a bot by avoiding robotic patterns.
 */
const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

const getRandomDelay = (min = 2000, max = 5000) => 
  Math.floor(Math.random() * (max - min + 1) + min);

/**
 * Professional User-Agent rotation (simplified for this example).
 */
const USER_AGENTS = [
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36",
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
  "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"
];

/**
 * Fetch today's products from Tap.az using the JSON-LD / __NEXT_DATA__ approach.
 * Enhanced with rate limiting and ethical scraping practices.
 */
async function fetchTapazTodayService(
  name,
  min_price = 0,
  max_price = 999999,
  categoryId = null
) {
  const baseUrl = "https://tap.az/elanlar";
  let totalProcessed = 0;
  let inserted = 0;
  let updated = 0;
  let cursor = null;
  let shouldStop = false;

  const normalizedCategoryId =
    categoryId !== undefined && categoryId !== null
      ? Number(categoryId)
      : null;

  const today = new Date();
  today.setHours(0, 0, 0, 0);

  while (!shouldStop) {
    try {
      // 1. Add a random delay before each request to mimic human behavior
      await sleep(getRandomDelay());

      const encodedKeywords = encodeURIComponent(name.trim());
      const current_min_price = min_price ?? 0;
      const current_max_price = max_price ?? 999999;

      const queryParams = [
        `q[keywords]=${encodedKeywords}`,
        `q[price][]=${current_min_price}`,
        `q[price][]=${current_max_price}`,
      ];

      if (cursor) {
        queryParams.push(`cursor=${cursor}`);
      }

      const url = `${baseUrl}?${queryParams.join("&")}`;

      // 2. Rotate User-Agent and include proper headers
      const randomUserAgent = USER_AGENTS[Math.floor(Math.random() * USER_AGENTS.length)];

      const response = await axios.get(url, {
        headers: {
          "User-Agent": randomUserAgent,
          "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
          "Accept-Language": "az,tr;q=0.9,en;q=0.8",
          "Referer": "https://tap.az/",
          "Cache-Control": "no-cache"
        },
        timeout: 20000,
      });

      const html = response.data;
      const jsonMatch = html.match(/<script id="__NEXT_DATA__" type="application\/json">(.*?)<\/script>/);
      
      if (!jsonMatch) {
        console.error("[TapazService] __NEXT_DATA__ not found. Site structure might have changed.");
        break;
      }

      const jsonData = JSON.parse(jsonMatch[1]);
      const pageProps = jsonData.props.pageProps;
      const adsData = (pageProps.latestAds && pageProps.latestAds.ads) || pageProps.ads;
      
      if (!adsData || !adsData.nodes || adsData.nodes.length === 0) {
        break;
      }

      const ads = adsData.nodes;

      for (const ad of ads) {
        const adId = ad.legacyResourceId?.toString();
        if (!adId) continue;

        // Skip VIP/Premium ads to respect normal listing order and avoid duplicates
        if (ad.kinds && (ad.kinds.includes("VIPPED") || ad.kinds.includes("PREMIUM"))) {
          continue;
        }

        const updatedAt = new Date(ad.updatedAt);
        const adDate = new Date(updatedAt);
        adDate.setHours(0, 0, 0, 0);

        // Stop if we reach yesterday's listings
        if (adDate.getTime() < today.getTime()) {
          shouldStop = true;
          break;
        }

        if (adDate.getTime() === today.getTime()) {
          const title = ad.title || "";
          if (!title.toLowerCase().includes(name.toLowerCase())) {
            continue;
          }

          const price = parseFloat(ad.price) || 0;
          if (price < current_min_price || price > current_max_price) {
            continue;
          }

          const currency = "AZN";
          const productUrl = `https://tap.az${ad.path}`;
          const imageUrl = ad.photo?.url || null;
          const region = ad.region || null;

          const extraInfo = JSON.stringify({ 
            city: region, 
            updated_at_raw: ad.updatedAt 
          });

          const formattedTime = updatedAt.toISOString().slice(0, 19).replace('T', ' ');

          const [rows] = await db.query(
            "SELECT id, price FROM products WHERE platform_id = ? AND platform_listing_id = ?",
            [TAPAZ_PLATFORM_ID, adId]
          );

          if (rows.length === 0) {
            await db.query(
              `INSERT INTO products (platform_id, platform_listing_id, title, price, currency, url, image_url, extra_info, time, is_notifo, category_id)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?)`,
              [
                TAPAZ_PLATFORM_ID,
                adId,
                title,
                price,
                currency,
                productUrl,
                imageUrl,
                extraInfo,
                formattedTime,
                normalizedCategoryId,
              ]
            );
            inserted++;
          } else {
            const existing = rows[0];
            if (Number(existing.price) !== Number(price)) {
              await db.query(
                `UPDATE products 
                 SET price = ?, is_notifo = 0, title = ?, currency = ?, url = ?, image_url = ?, extra_info = ?, time = ?, category_id = COALESCE(?, category_id) 
                 WHERE id = ?`,
                [
                  price,
                  title,
                  currency,
                  productUrl,
                  imageUrl,
                  extraInfo,
                  formattedTime,
                  normalizedCategoryId,
                  existing.id,
                ]
              );
              updated++;
            }
          }
          totalProcessed++;
        }
      }

      if (!shouldStop && adsData.pageInfo && adsData.pageInfo.hasNextPage) {
        cursor = adsData.pageInfo.endCursor;
      } else {
        break;
      }

    } catch (error) {
      if (error.response && error.response.status === 429) {
        console.error("[TapazService] Rate limit hit (429). Sleeping for longer...");
        await sleep(60000); // Wait a full minute if rate limited
      } else {
        console.error("[TapazService] Loop Error:", error.message);
      }
      break;
    }
  }

  return { processed: totalProcessed, inserted, updated };
}

module.exports = { fetchTapazTodayService };
