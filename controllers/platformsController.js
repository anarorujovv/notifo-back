const db = require("../db");
const R = require("../services/response");

/**
 * List platforms.
 * - Optional query: active=true to filter only active platforms.
 */
async function listPlatforms(req, res) {
  try {
    const { active } = req.query || {};
    const onlyActive = String(active).toLowerCase() === "true";

    const sql = onlyActive
      ? `SELECT id, name, slug, base_url, is_active, created_at FROM platforms WHERE is_active = 1 ORDER BY id ASC`
      : `SELECT id, name, slug, base_url, is_active, created_at FROM platforms ORDER BY id ASC`;

    const [rows] = await db.query(sql);
    return R.ok(res, "Platforms retrieved successfully.", rows);
  } catch (error) {
    console.error("[DB] listPlatforms error:", error);
    return R.serverError(res, "Database error", error);
  }
}

module.exports = { listPlatforms };


