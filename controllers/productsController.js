const db = require("../db");
const R = require("../services/response");
const { fetchTapazTodayService } = require("../services/productsService");

const TAPAZ_PLATFORM_ID = 1;

async function fetchTapazToday(req, res) {
  const {
    name,
    min_price = 0,
    max_price = 999999,
    category_id = null,
  } = req.body || {};
  if (!name || typeof name !== "string") {
    return R.badRequest(res, "Missing or invalid field: name.");
  }

  try {
    const [conns] = await db.query(
      "SELECT id FROM user_platforms WHERE platform_id = ? AND is_connected = TRUE",
      [ TAPAZ_PLATFORM_ID]
    );
    if (conns.length === 0) {
      return R.forbidden(res, "Tap.az platform is not connected or inactive.");
    }

    const result = await fetchTapazTodayService(
      name,
      min_price,
      max_price,
      category_id
    );
    return R.ok(res, "Tap.az fetch completed.", result);
  } catch (error) {
    console.error("[FETCH] tapaz today error:", error);
    return R.serverError(res, "Fetch error", error);
  }
}

async function getNotifications(req, res) {
  const userId = req.user?.id;
  if (!userId) return R.unauthorized(res);

  try {
    // Fetch products matching user filters that haven't been marked as notified in this logic
    // However, the user wants a global 'is_notifo' but for individual users.
    // Given the previous requirement, we will show products that match user filters.
    const [products] = await db.query(
      `SELECT p.*, plat.name as platform_name 
       FROM products p
       JOIN platforms plat ON p.platform_id = plat.id
       JOIN filters f ON f.category_id = p.category_id
       WHERE f.user_id = ? 
         AND p.price BETWEEN f.min_price AND f.max_price
         AND p.title LIKE CONCAT('%', (SELECT name_az FROM categories WHERE id = f.category_id), '%')
         AND p.is_notifo = 1
       ORDER BY p.time DESC LIMIT 50`,
      [userId]
    );
    return R.ok(res, "Notifications fetched", products);
  } catch (error) {
    return R.serverError(res, "Error fetching notifications", error);
  }
}

module.exports = { fetchTapazToday, getNotifications };
