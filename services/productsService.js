const axios = require("axios");
const db = require("../db");
const TAPAZ_PLATFORM_ID = 1;

/**
 * Fetch today's products from Tap.az using the JSON-LD / __NEXT_DATA__ approach.
 * @param {string} name - The name of the product (keyword).
 * @param {number} min_price - The minimum price of the product.
 * @param {number} max_price - The maximum price of the product.
 * @param {number} categoryId - The category ID of the product.
 * @returns {Promise<{processed: number, inserted: number, updated: number}>}
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

  const normalizedCategoryId =
    categoryId !== undefined && categoryId !== null
      ? Number(categoryId)
      : null;

  try {
    const encodedKeywords = encodeURIComponent(name.trim());
    const current_min_price = min_price ?? 0;
    const current_max_price = max_price ?? 999999;

    // Tap.az query parameters
    const queryParams = [
      `q[keywords]=${encodedKeywords}`,
      `q[price][]=${current_min_price}`,
      `q[price][]=${current_max_price}`,
    ];

    const url = `${baseUrl}?${queryParams.join("&")}`;

    const response = await axios.get(url, {
      headers: {
        "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
        "Accept-Language": "az,tr;q=0.9,en;q=0.8",
      },
      timeout: 20000,
    });

    const html = response.data;
    const jsonMatch = html.match(/<script id="__NEXT_DATA__" type="application\/json">(.*?)<\/script>/);
    
    if (!jsonMatch) {
      console.error("[TapazService] __NEXT_DATA__ not found in HTML");
      return { processed: 0, inserted: 0, updated: 0 };
    }

    const jsonData = JSON.parse(jsonMatch[1]);
    const pageProps = jsonData.props.pageProps;
    const adsData = (pageProps.latestAds && pageProps.latestAds.ads) || pageProps.ads;
    
    if (!adsData || !adsData.nodes) {
      return { processed: 0, inserted: 0, updated: 0 };
    }

    const ads = adsData.nodes;
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    for (const ad of ads) {
      const adId = ad.legacyResourceId?.toString();
      if (!adId) continue;

      // 1. Title Filter (must contain the keyword)
      const title = ad.title || "";
      if (!title.toLowerCase().includes(name.toLowerCase())) {
        continue;
      }

      // 2. Price Filter (Double check in code because API might return broader results)
      const price = parseFloat(ad.price) || 0;
      if (price < current_min_price || price > current_max_price) {
        continue;
      }

      // 3. Date Filter (Today only)
      const updatedAt = new Date(ad.updatedAt);
      const adDate = new Date(updatedAt);
      adDate.setHours(0, 0, 0, 0);

      if (adDate.getTime() !== today.getTime()) {
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

  } catch (error) {
    console.error("[TapazService] Error:", error.message);
  }

  return { processed: totalProcessed, inserted, updated };
}

module.exports = { fetchTapazTodayService };
