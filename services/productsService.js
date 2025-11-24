const axios = require("axios");
const cheerio = require("cheerio");
const db = require("../db");
const TAPAZ_PLATFORM_ID = 1;

/**
 * Fetch today's products from Tap.az.
 * @param {string} name - The name of the product.
 * @param {number} min_price - The minimum price of the product.
 * @param {number} max_price - The maximum price of the product.
 * @param {number} categoryId - The category ID of the product.
 * @returns {Promise<{processed: number, inserted: number, updated: number}>} - The number of products processed, inserted, and updated.
 */
async function fetchTapazTodayService(
  name,
  min_price = 0,
  max_price = 999999,
  categoryId = null
) {
  const baseUrl = "https://tap.az/elanlar";
  let cursor = null;
  let page = 1;
  let totalProcessed = 0;
  let inserted = 0;
  let updated = 0;

  const normalizedCategoryId =
    categoryId !== undefined && categoryId !== null
      ? Number(categoryId)
      : null;

  while (true) {
    const encodedKeywords = encodeURIComponent(name.trim());
    const current_min_price = min_price ?? 0;
    const current_max_price = max_price ?? 999999;

    const queryParams = [
      `q[keywords]=${encodedKeywords}`,
      `q[price][]=${current_min_price}`,
      `q[price][]=${current_max_price}`,
      "keywords_source=typewritten",
      "order=",
      "q[contact_id]=",
      "q[region_id]=",
      "q[user_id]=",
      "ajax=1",
    ];

    if (cursor) {
      queryParams.push(`cursor=${cursor}`);
    }

    const url = `${baseUrl}?${queryParams.join("&")}`;

    const response = await axios.get(url, {
      headers: {
        "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36",
        "Referer": "https://tap.az/elanlar",
        "X-Requested-With": "XMLHttpRequest",
        "Accept": "text/html, */*; q=0.01",
      },
      timeout: 20000,
    });

    const $ = cheerio.load(response.data);

    const products = $("div.products-i");
    if (products.length === 0) {
      break;
    }

    let shouldStop = false;

    for (const el of products) {
      const adId = $(el).find("button").attr("data-ad-id");
      if (!adId) continue;

      const createdText = $(el)
        .find(".products-created")
        .text()
        .trim()
        .toLowerCase();

      const isToday =
        createdText.includes("bugün") ||
        createdText.includes("bu gün") ||
        createdText.includes("today");

      if (!isToday) {
        shouldStop = true;
        break;
      }

      const title = $(el).find(".products-name").text().trim();
      const priceText = $(el).find(".price-val").text().trim();
      const priceCur = $(el).find(".price-cur").text().trim() || "AZN";
      const price =
        parseFloat(
          priceText.replace(/[^0-9.,]/g, "").replace(/\./g, "").replace(",", ".")
        ) || 0;
      const urlPath = $(el).find("a.products-link").attr("href") || "";
      const productUrl = urlPath.startsWith("http") ? urlPath : `https://tap.az${urlPath}`;
      const img = $(el).find("img").attr("data-src") || $(el).find("img").attr("src") || null;

      let city = null, timePart = null;
      const parts = createdText.split(",").map((p) => p.trim());
      if (parts.length >= 3) {
        city = parts[0];
        timePart = parts[2];
      }

      const now = new Date();
      const yyyy = now.getFullYear();
      const mm = String(now.getMonth() + 1).padStart(2, "0");
      const dd = String(now.getDate()).padStart(2, "0");
      const time = timePart && /^\d{1,2}:\d{2}$/.test(timePart)
        ? `${yyyy}-${mm}-${dd} ${timePart}:00`
        : `${yyyy}-${mm}-${dd} 00:00:00`;

      const extraInfo = JSON.stringify({ city, raw_created: createdText });

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
            priceCur,
            productUrl,
            img,
            extraInfo,
            time,
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
              priceCur,
              productUrl,
              img,
              extraInfo,
              time,
              normalizedCategoryId,
              existing.id,
            ]
          );
          updated++;
        }
      }
      totalProcessed++;
    }

    if (shouldStop) break;

    const nextHref = $(".pagination .next a").attr("href");
    if (!nextHref) {
      break;
    }
    const urlParams = new URLSearchParams(nextHref.split("?")[1]);
    const nextCursor = urlParams.get("cursor");
    if (!nextCursor) {
      break;
    }
    cursor = nextCursor;
    page++;
  }

  return { processed: totalProcessed, inserted, updated };
}

module.exports = { fetchTapazTodayService };


