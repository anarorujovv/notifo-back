const db = require("../db");
const { fetchTapazTodayService } = require("../services/productsService");

const TAPAZ_PLATFORM_ID = 1;
const KONTAKT_PLATFORM_ID = 2;
const IRSHAD_PLATFORM_ID = 3;
const LALAFO_PLATFORM_ID = 4;

/**
 * Main cron job: Fetch products for all active filters with connected platforms
 */
async function runFilterCron() {
  try {
    // Step 1: Get all active filters with their connected platforms
    const [filterPlatforms] = await db.query(
      `SELECT 
        f.id AS filter_id,
        f.category_id,
        f.min_price,
        f.max_price,
        c.name_az AS category_name,
        c.name_en AS category_name_en,
        up.platform_id,
        p.slug AS platform_slug
       FROM filter_platforms fp
       INNER JOIN filters f ON f.id = fp.filter_id
       INNER JOIN categories c ON c.id = f.category_id
       INNER JOIN user_platforms up ON up.id = fp.user_platform_id
       INNER JOIN platforms p ON p.id = up.platform_id
       WHERE up.is_connected = 1 AND p.is_active = 1`
    );

    if (filterPlatforms.length === 0) return;

    // Step 2: Process each filter individually to respect its specific price range
    for (const fp of filterPlatforms) {
      try {
        const categoryName = fp.category_name || fp.category_name_en || "";
        const minPrice = parseFloat(fp.min_price) || 0;
        const maxPrice = parseFloat(fp.max_price) || 999999;

        if (fp.platform_id === TAPAZ_PLATFORM_ID) {
          await fetchTapazTodayService(
            categoryName,
            minPrice,
            maxPrice,
            fp.category_id
          );
        }
        // Other platforms can be added here...
        
      } catch (error) {
        console.error(`[CRON] Error for filter ${fp.filter_id} on platform ${fp.platform_id}:`, error.message);
      }
    }

  } catch (error) {
    console.error("[CRON] Error in runFilterCron:", error);
  }
}

module.exports = { runFilterCron };
