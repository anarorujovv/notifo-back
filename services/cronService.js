const db = require("../db");
const { fetchTapazTodayService } = require("../services/productsService");

const TAPAZ_PLATFORM_ID = 1;
const KONTAKT_PLATFORM_ID = 2;
const IRSHAD_PLATFORM_ID = 3;
const LALAFO_PLATFORM_ID = 4;

/**
 * Fetch products from Kontakt Home (placeholder for future implementation)
 */
async function fetchKontaktProducts(
  categoryName,
  minPrice = 0,
  maxPrice = 999999
) {
  return { processed: 0, inserted: 0, updated: 0 };
}

/**
 * Fetch products from Irşad Electronics (placeholder for future implementation)
 */
async function fetchIrshadProducts(
  categoryName,
  minPrice = 0,
  maxPrice = 999999
) {
  return { processed: 0, inserted: 0, updated: 0 };
}

/**
 * Fetch products from Lalafo (placeholder for future implementation)
 */
async function fetchLalafoProducts(
  categoryName,
  minPrice = 0,
  maxPrice = 999999
) {
  return { processed: 0, inserted: 0, updated: 0 };
}

/**
 * Main cron job: Fetch products for all active filters with connected platforms
 */
async function runFilterCron() {

  try {
    // Step 1: Get all filter_platforms with active connections
    const [filterPlatforms] = await db.query(
      `SELECT 
        fp.id AS filter_platform_id,
        fp.filter_id,
        fp.user_platform_id,
        f.category_id,
        f.min_price,
        f.max_price,
        c.name_az AS category_name,
        c.name_en AS category_name_en,
        up.platform_id,
        p.name AS platform_name,
        p.slug AS platform_slug
       FROM filter_platforms fp
       INNER JOIN filters f ON f.id = fp.filter_id
       INNER JOIN categories c ON c.id = f.category_id
       INNER JOIN user_platforms up ON up.id = fp.user_platform_id
       INNER JOIN platforms p ON p.id = up.platform_id
       WHERE up.is_connected = 1 AND p.is_active = 1`
    );

    if (filterPlatforms.length === 0) {
      return;
    }

    // Step 2: Group by unique category_id + platform_id combinations
    const categoryPlatformMap = {};

    for (const fp of filterPlatforms) {
      const key = `${fp.category_id}_${fp.platform_id}`;

      if (!categoryPlatformMap[key]) {
        categoryPlatformMap[key] = {
          category_id: fp.category_id,
          category_name: fp.category_name,
          category_name_en: fp.category_name_en,
          platform_id: fp.platform_id,
          platform_name: fp.platform_name,
          platform_slug: fp.platform_slug,
          filters: [],
        };
      }

      // Keep track of which filters use this combination
      categoryPlatformMap[key].filters.push({
        filter_id: fp.filter_id,
        min_price: fp.min_price,
        max_price: fp.max_price,
      });
    }

    const uniqueCombinations = Object.values(categoryPlatformMap);

    // Step 3: Process each unique category-platform combination
    for (const combo of uniqueCombinations) {
      try {
        const categoryName =
          combo.category_name || combo.category_name_en || "";

        let result = { processed: 0, inserted: 0, updated: 0 };

        // Route to appropriate platform fetcher
        switch (combo.platform_id) {
          case TAPAZ_PLATFORM_ID:
            // Call service directly with category and price range
            result = await fetchTapazTodayService(
              categoryName,
              0,
              999999,
              combo.category_id
            );
            break;

          case KONTAKT_PLATFORM_ID:
            // Placeholder for Kontakt Home
            result = await fetchKontaktProducts(categoryName, 0, 999999);
            break;

          case IRSHAD_PLATFORM_ID:
            // Placeholder for Irşad Electronics
            result = await fetchIrshadProducts(categoryName, 0, 999999);
            break;

          case LALAFO_PLATFORM_ID:
            // Placeholder for Lalafo
            result = await fetchLalafoProducts(categoryName, 0, 999999);
            break;

          default:
          }
      } catch (error) {
        console.error(
          `[CRON] Error processing category ${combo.category_id} on platform ${combo.platform_id}:`,
          error
        );
      }
    }

  } catch (error) {
    console.error("[CRON] Error in runFilterCron:", error);
  }
}

module.exports = { runFilterCron };
