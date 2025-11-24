const db = require("../db");
const R = require("../services/response");

/**
 * Create a filter for the authenticated user.
 * Body: { category_id: number, min_price?: number, max_price?: number, user_platform_ids?: number[] }
 */
async function createFilter(req, res) {
  const { category_id, min_price, max_price, user_platform_ids } = req.body || {};
  if (!category_id) return R.badRequest(res, "Missing required field: category_id.");

  try {
    const userId = req.user?.id;
    if (!userId) return R.unauthorized(res, "Unauthorized.");

    // Start transaction
    const connection = await db.getConnection();
    await connection.beginTransaction();

    try {
      // Insert filter
      const [result] = await connection.query(
        `INSERT INTO filters (user_id, category_id, min_price, max_price)
         VALUES (?, ?, ?, ?)`,
        [userId, category_id, min_price ?? 0, max_price ?? 0]
      );

      const filterId = result.insertId;

      // Insert filter_platforms if provided
      if (Array.isArray(user_platform_ids) && user_platform_ids.length > 0) {
        for (const userPlatformId of user_platform_ids) {
          // Verify user_platform belongs to the authenticated user
          const [upRows] = await connection.query(
            "SELECT id FROM user_platforms WHERE id = ? AND user_id = ?",
            [userPlatformId, userId]
          );
          
          if (upRows.length > 0) {
            await connection.query(
              "INSERT INTO filter_platforms (filter_id, user_platform_id) VALUES (?, ?)",
              [filterId, userPlatformId]
            );
          }
        }
      }

      await connection.commit();
      return R.created(res, "Filter created successfully.");
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  } catch (error) {
    console.error("[DB] createFilter error:", error);
    return R.serverError(res, "Database error", error);
  }
}

/**
 * List filters for the authenticated user.
 */
async function listFilters(req, res) {
  try {
    const userId = req.user?.id;
    if (!userId) return R.unauthorized(res, "Unauthorized.");

    // Get filters with category info
    const [filterRows] = await db.query(
      `SELECT f.id, f.category_id, f.min_price, f.max_price, f.created_at, f.updated_at,
              c.name_az AS category_name_az, c.slug AS category_slug
       FROM filters f
       INNER JOIN categories c ON c.id = f.category_id
       WHERE f.user_id = ?
       ORDER BY f.updated_at DESC`,
      [userId]
    );

    // Get filter_platforms for each filter
    for (const filter of filterRows) {
      const [platformRows] = await db.query(
        `SELECT 
          fp.user_platform_id,
          p.name AS platform_name
         FROM filter_platforms fp
         INNER JOIN user_platforms up ON up.id = fp.user_platform_id
         INNER JOIN platforms p ON p.id = up.platform_id
         WHERE fp.filter_id = ?`,
        [filter.id]
      );
      
      filter.user_platforms = platformRows;
    }

    return R.ok(res, "Filters retrieved successfully.", filterRows);
  } catch (error) {
    console.error("[DB] listFilters error:", error);
    return R.serverError(res, "Database error", error);
  }
}

/**
 * Update a filter (only owned by the authenticated user).
 * Body: { category_id?: number, min_price?: number, max_price?: number, user_platform_ids?: number[] }
 */
async function updateFilter(req, res) {
  const { id } = req.params;
  const { category_id, min_price, max_price, user_platform_ids } = req.body || {};
  if (!id) return R.badRequest(res, "Missing required parameter: id.");

  try {
    const userId = req.user?.id;
    if (!userId) return R.unauthorized(res, "Unauthorized.");

    // Verify ownership
    const [rows] = await db.query("SELECT user_id FROM filters WHERE id = ?", [id]);
    if (rows.length === 0) return R.notFound(res, "Filter not found.");
    if (Number(rows[0].user_id) !== Number(userId)) return R.forbidden(res, "Forbidden.");

    const connection = await db.getConnection();
    await connection.beginTransaction();

    try {
      // Update filter basic info
      await connection.query(
        `UPDATE filters SET
           category_id = COALESCE(?, category_id),
           min_price = COALESCE(?, min_price),
           max_price = COALESCE(?, max_price)
         WHERE id = ?`,
        [category_id ?? null, min_price ?? null, max_price ?? null, id]
      );

      // Update filter_platforms if provided
      if (user_platform_ids !== undefined) {
        // Delete existing
        await connection.query("DELETE FROM filter_platforms WHERE filter_id = ?", [id]);

        // Insert new ones
        if (Array.isArray(user_platform_ids) && user_platform_ids.length > 0) {
          for (const userPlatformId of user_platform_ids) {
            // Verify user_platform belongs to the authenticated user
            const [upRows] = await connection.query(
              "SELECT id FROM user_platforms WHERE id = ? AND user_id = ?",
              [userPlatformId, userId]
            );
            
            if (upRows.length > 0) {
              await connection.query(
                "INSERT INTO filter_platforms (filter_id, user_platform_id) VALUES (?, ?)",
                [id, userPlatformId]
              );
            }
          }
        }
      }

      await connection.commit();
      return R.ok(res, "Filter updated successfully.");
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  } catch (error) {
    console.error("[DB] updateFilter error:", error);
    return R.serverError(res, "Database error", error);
  }
}

/**
 * Delete a filter (only owned by the authenticated user).
 */
async function deleteFilter(req, res) {
  const { id } = req.params;
  if (!id) return R.badRequest(res, "Missing required parameter: id.");

  try {
    const userId = req.user?.id;
    if (!userId) return R.unauthorized(res, "Unauthorized.");

    const [rows] = await db.query("SELECT user_id FROM filters WHERE id = ?", [id]);
    if (rows.length === 0) return R.notFound(res, "Filter not found.");
    if (Number(rows[0].user_id) !== Number(userId)) return R.forbidden(res, "Forbidden.");

    await db.query("DELETE FROM filters WHERE id = ?", [id]);
    return R.ok(res, "Filter deleted successfully.");
  } catch (error) {
    console.error("[DB] deleteFilter error:", error);
    return R.serverError(res, "Database error", error);
  }
}

module.exports = {
  createFilter,
  listFilters,
  updateFilter,
  deleteFilter,
};


