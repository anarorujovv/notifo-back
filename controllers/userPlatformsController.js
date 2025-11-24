const db = require("../db");
const R = require("../services/response");

/**
 * Add a platform mapping for the authenticated user.
 * - Requires body: { platform_id, auth_token? }
 * - Fails if mapping already exists.
 */
async function addPlatform(req, res) {
  const { platform_id, auth_token } = req.body || {};

  if (!platform_id) {
    return R.badRequest(res, "Missing required field: platform_id.");
  }

  try {
    const userId = req.user?.id;
    if (!userId) return R.unauthorized(res, "Unauthorized.");

    const [existing] = await db.query(
      "SELECT id FROM user_platforms WHERE user_id = ? AND platform_id = ?",
      [userId, platform_id]
    );
    if (existing.length > 0) {
      return R.conflict(res, "Mapping already exists for this platform.");
    }

    await db.query(
      "INSERT INTO user_platforms (user_id, platform_id, auth_token, is_connected) VALUES (?, ?, ?, TRUE)",
      [userId, platform_id, auth_token || null]
    );

    return R.ok(res, "Platform mapping created successfully.");
  } catch (error) {
    console.error("[DB] addPlatform error:", error);
    return R.serverError(res, "Database error", error);
  }
}

/**
 * Activate a platform mapping by user_platforms id for the authenticated user.
 * - URL param: :id
 * - Body: { auth_token? }
 * - Only succeeds if the mapping exists, is owned by user, and is deactivated.
 */
async function activatePlatform(req, res) {
  const { id } = req.params;
  const { auth_token } = req.body || {};

  if (!id) return R.badRequest(res, "Missing required parameter: id.");

  try {
    const [rows] = await db.query(
      "SELECT user_id, is_connected FROM user_platforms WHERE id = ?",
      [id]
    );
    if (rows.length === 0) return R.notFound(res, "Connection not found.");

    if (!req.user || Number(rows[0].user_id) !== Number(req.user.id)) {
      return R.forbidden(res, "Forbidden.");
    }

    if (rows[0].is_connected === 1 || rows[0].is_connected === true) {
      return R.conflict(res, "Already active.");
    }

    await db.query(
      "UPDATE user_platforms SET is_connected = TRUE, auth_token = ? WHERE id = ?",
      [auth_token || null, id]
    );
    return R.ok(res, "Platform connection activated successfully.", {
      id: Number(id),
      is_connected: true,
    });
  } catch (error) {
    console.error("[DB] activatePlatform error:", error);
    return R.serverError(res, "Database error", error);
  }
}

/**
 * Deactivate a connection by user_platforms id (owned by the auth user).
 */
async function deactivateById(req, res) {
  const { id } = req.params;

  if (!id) {
    return R.badRequest(res, "Missing required parameter: id.");
  }

  try {
    const [rows] = await db.query(
      "SELECT user_id, is_connected FROM user_platforms WHERE id = ?",
      [id]
    );
    if (rows.length === 0) {
      return R.notFound(res, "Connection not found.");
    }

    if (!req.user || Number(rows[0].user_id) !== Number(req.user.id)) {
      return R.forbidden(res, "Forbidden.");
    }

    if (rows[0].is_connected === 0 || rows[0].is_connected === false) {
      return R.conflict(res, "Already deactivated.");
    }

    await db.query("UPDATE user_platforms SET is_connected = FALSE WHERE id = ?", [
      id,
    ]);

    return R.ok(res, "Connection deactivated successfully.", {
      id: Number(id),
      is_connected: false,
    });
  } catch (error) {
    console.error("[DB] deactivateById error:", error);
    return R.serverError(res, "Database error", error);
  }
}

/**
 * Delete a user-platform connection by id.
 */
async function deleteConnection(req, res) {
  const { id } = req.params;

  if (!id) {
    return R.badRequest(res, "Missing required parameter: id.");
  }

  try {
    // Verify ownership first
    const [rows] = await db.query(
      "SELECT user_id FROM user_platforms WHERE id = ?",
      [id]
    );
    if (rows.length === 0) {
      return R.notFound(res, "Connection not found.");
    }

    if (!req.user || Number(rows[0].user_id) !== Number(req.user.id)) {
      return R.forbidden(res, "Forbidden.");
    }

    const [result] = await db.query(
      "DELETE FROM user_platforms WHERE id = ?",
      [id]
    );
    if (result.affectedRows === 0) {
      return R.notFound(res, "Connection not found.");
    }

    return R.ok(res, "Connection deleted successfully.");
  } catch (error) {
    console.error("[DB] deleteConnection error:", error);
    return R.serverError(res, "Database error", error);
  }
}

/**
 * List all platforms connected to a user.
 * - Joins `user_platforms` with `platforms` to include platform details.
 */
async function listUserPlatforms(req, res) {
  try {
    const userId = req.user?.id;
    if (!userId) return R.unauthorized(res, "Unauthorized.");

    const [rows] = await db.query(
      `SELECT 
        up.id AS user_platform_id,
        up.user_id,
        up.platform_id,
        up.is_connected,
        up.connected_at,
        p.name,
        p.slug,
        p.base_url
      FROM user_platforms up
      INNER JOIN platforms p ON p.id = up.platform_id
      WHERE up.user_id = ?
      ORDER BY up.connected_at DESC`,
      [userId]
    );

    return R.ok(res, "User platforms retrieved successfully.", rows);
  } catch (error) {
    console.error("[DB] listUserPlatforms error:", error);
    return R.serverError(res, "Database error", error);
  }
}

module.exports = {
  addPlatform,
  activatePlatform,
  deactivateById,
  deleteConnection,
  listUserPlatforms,
};


