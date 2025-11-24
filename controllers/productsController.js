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

module.exports = { fetchTapazToday };
