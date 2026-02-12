const axios = require("axios");
const db = require("../db");
const TAPAZ_PLATFORM_ID = 1;

/**
 * Fetch today's products from Tap.az using the JSON-LD / __NEXT_DATA__ approach.
 * Stops when an ad from "yesterday" is encountered.
 * Skips VIP ads.
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

      const response = await axios.get(url, {
        headers: {
          "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
          "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
          "Accept-Language": "az,tr;q=0.9,en;q=0.8",
        },
        timeout: 20000,
      });

      const html = response.data;
      const jsonMatch = html.match(/<script id="__NEXT_DATA__" type="application\/json">(.*?)<\/script>/);
      
      if (!jsonMatch) {
        console.error("[TapazService] __NEXT_DATA__ not found");
        break;
      }

      const jsonData = JSON.parse(jsonMatch[1]);
      const pageProps = jsonData.props.pageProps;
      
      // VIP ads are usually in 'vipAds', normal ads in 'latestAds' or 'ads'
      // We ONLY want normal ads.
      const adsData = (pageProps.latestAds && pageProps.latestAds.ads) || pageProps.ads;
      
      if (!adsData || !adsData.nodes || adsData.nodes.length === 0) {
        break;
      }

      const ads = adsData.nodes;

      for (const ad of ads) {
        const adId = ad.legacyResourceId?.toString();
        if (!adId) continue;

        // Skip VIP ads (They often have kinds like 'VIPPED', 'PREMIUM', etc.)
        // In the JSON structure, we check 'kinds' array
        if (ad.kinds && (ad.kinds.includes("VIPPED") || ad.kinds.includes("PREMIUM"))) {
          continue;
        }

        const updatedAt = new Date(ad.updatedAt);
        const adDate = new Date(updatedAt);
        adDate.setHours(0, 0, 0, 0);

        // If we hit an ad from YESTERDAY or earlier, stop everything
        if (adDate.getTime() < today.getTime()) {
          shouldStop = true;
          break;
        }

        // Only process ads from TODAY
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
              `INSERT INTO products (platform_id, platform_listing_id, title, price, currency, url, image_url, extra_info, time, is_viewed, category_id)
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
                 SET price = ?, is_viewed = 0, title = ?, currency = ?, url = ?, image_url = ?, extra_info = ?, time = ?, category_id = COALESCE(?, category_id) 
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

      // Check for next page cursor
      if (!shouldStop && adsData.pageInfo && adsData.pageInfo.hasNextPage) {
        cursor = adsData.pageInfo.endCursor;
      } else {
        break;
      }

    } catch (error) {
      console.error("[TapazService] Loop Error:", error.message);
      break;
    }
  }

  return { processed: totalProcessed, inserted, updated };
}

module.exports = { fetchTapazTodayService };
