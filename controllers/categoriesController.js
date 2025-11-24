const db = require("../db");
const R = require("../services/response");

/**
 * List categories.
 * - Returns all categories with their basic fields.
 * - Includes parent_id to support client-side tree building if needed.
 */
async function listCategories(req, res) {
  try {
    const [rows] = await db.query(
      `SELECT id, name_az, name_en, slug, parent_id, created_at FROM categories ORDER BY id ASC`
    );

    return R.ok(res, "Categories retrieved successfully.", rows);
  } catch (error) {
    console.error("[DB] listCategories error:", error);
    return R.serverError(res, "Database error", error);
  }
}

module.exports = { listCategories };


