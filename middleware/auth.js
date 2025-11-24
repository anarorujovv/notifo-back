const jwt = require("jsonwebtoken");
const R = require("../services/response");

// NOTE: Keep in sync with the secret used in routes/users.js
const JWT_SECRET = "notifo29092006";

/**
 * Express middleware to require a valid JWT Bearer token.
 * - Reads token from Authorization header (format: "Bearer <token>")
 * - Verifies token and attaches decoded payload to req.user
 */
module.exports = function auth(req, res, next) {
  const header = req.headers.authorization;
  const token =
    header && header.startsWith("Bearer ") ? header.split(" ")[1] : null;

  if (!token) {
    return R.unauthorized(res, "Token missing.");
  }

  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    req.user = decoded;
    return next();
  } catch (e) {
    return R.unauthorized(res, "Invalid token.");
  }
};