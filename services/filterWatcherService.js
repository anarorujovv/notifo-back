const db = require("../db");

const DEFAULT_INTERVAL_MS = 30_000;
const DEFAULT_MAX_PRICE = 999_999_999;

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function getConnectedPlatformIds(userId) {
  const [rows] = await db.query(
    `SELECT up.platform_id
       FROM user_platforms up
      WHERE up.user_id = ?
        AND up.is_connected = 1`,
    [userId]
  );

  return rows.map((row) => Number(row.platform_id));
}

async function getFilterPlatformIds(filterId) {
  const [rows] = await db.query(
    `SELECT up.platform_id
       FROM filter_platforms fp
       JOIN user_platforms up ON up.id = fp.user_platform_id
      WHERE fp.filter_id = ?`,
    [filterId]
  );

  return rows.map((row) => Number(row.platform_id));
}

async function getPlatformMetadata(platformIds) {
  if (platformIds.length === 0) return new Map();

  const [rows] = await db.query(
    `SELECT id, name
       FROM platforms
      WHERE id IN (?)`,
    [platformIds]
  );

  return rows.reduce((map, row) => {
    map.set(Number(row.id), row.name);
    return map;
  }, new Map());
}

async function getMatchingProducts(platformId, categoryId, minPrice, maxPrice) {
  const upperBound = maxPrice > 0 ? maxPrice : DEFAULT_MAX_PRICE;
  const lowerBound = minPrice > 0 ? minPrice : 0;
  const effectiveMin = Math.min(lowerBound, upperBound);
  const effectiveMax = Math.max(lowerBound, upperBound);

  const [rows] = await db.query(
    `SELECT id, title, price, url, image_url, platform_id, currency, time
       FROM products
      WHERE platform_id = ?
        AND category_id = ?
        AND is_notifo = 0
        AND price BETWEEN ? AND ?
      ORDER BY time DESC
      `,
    [platformId, categoryId, effectiveMin, effectiveMax]
  );
  
  if (!rows.length) return [];

  return rows;
}

async function markProductsAsNotified(productIds) {
  if (!productIds || productIds.length === 0) return;
  await db.query(
    "UPDATE products SET is_notifo = 1 WHERE id IN (?)",
    [productIds]
  );
}

async function filterWatcherService({ intervalMs = DEFAULT_INTERVAL_MS, io = null } = {}) {

  while (true) {
    try {
      const [filters] = await db.query(
        "SELECT id, user_id, category_id, min_price, max_price FROM filters"
      );

      if (!filters.length) {
        await sleep(intervalMs);
        continue;
      }

      const allNotifiedProductIds = new Set();

      for (const filter of filters) {
        try {
          const userId = Number(filter.user_id);
          const categoryId = Number(filter.category_id);

          if (!categoryId) continue;

          const userPlatforms = await getConnectedPlatformIds(userId);
          if (!userPlatforms.length) continue;

          const filterPlatforms = await getFilterPlatformIds(filter.id);
          if (!filterPlatforms.length) continue;

          const validPlatforms = [
            ...new Set(
              userPlatforms.filter((id) => filterPlatforms.includes(id))
            ),
          ];

          if (!validPlatforms.length) continue;

          const platformNames = await getPlatformMetadata(validPlatforms);
          const platformResults = [];

          for (const platformId of validPlatforms) {
            const products = await getMatchingProducts(
              platformId,
              categoryId,
              Number(filter.min_price) || 0,
              Number(filter.max_price) || 0
            );

            if (!products.length) continue;

            products.forEach(p => {
              allNotifiedProductIds.add(p.id);
              // Add platform name to product for front-end
              p.platform_name = platformNames.get(platformId);
            });

            platformResults.push({
              platform_id: platformId,
              title: platformNames.get(platformId) || `Platform #${platformId}`,
              noti_products: products,
            });
          }

          if (platformResults.length && io) {
            // Emit to specific user room via Socket.io
            io.to(`user_${userId}`).emit("new_notification", {
              filter_id: Number(filter.id),
              platforms: platformResults
            });
            console.log(`[Watcher] Emitted Socket notification to user_${userId}`);
          }
        } catch (filterError) {
          console.error(
            `[Watcher] Error while processing filter ${filter.id}:`,
            filterError
          );
        }
      }

      if (allNotifiedProductIds.size > 0) {
        await markProductsAsNotified(Array.from(allNotifiedProductIds));
        console.log(`[Watcher] Marked ${allNotifiedProductIds.size} products as notified.`);
      }

    } catch (error) {
      console.error("[Watcher] Unexpected error:", error);
    }

    await sleep(intervalMs);
  }
}

module.exports = filterWatcherService;
