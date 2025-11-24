const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const db = require("../db");
const R = require("../services/response");
const router = express.Router();

// JWT Secret (env file move)
const JWT_SECRET = "notifo29092006";

// Create user (register)
router.post("/register", async (req, res) => {
  const { name, email, password } = req.body;
  if (!name || !email || !password)
    return R.badRequest(res, "Not enough information!");

  try {
    const hash = await bcrypt.hash(password, 10);
    await db.query(
      "INSERT INTO users (name, email, password) VALUES (?, ?, ?)",
      [name, email, hash]
    );
    return R.ok(res, "User successfully created!");
  } catch (err) {
    if (err.code === "ER_DUP_ENTRY")
      return R.badRequest(res, "This email is already registered!");
    console.error(err);
    return R.serverError(res, "Server error.", err);
  }
});

// Login (login)
router.post("/login", async (req, res) => {
  const { email, password } = req.body;
  const [rows] = await db.query("SELECT * FROM users WHERE email = ?", [email]);
  const user = rows[0];
  if (!user) return R.badRequest(res, "User not found!");

  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) return R.badRequest(res, "Wrong password!");

  const token = jwt.sign({ id: user.id, email: user.email }, JWT_SECRET, {
    expiresIn: "7d",
  });
  return R.ok(res, "Login successful!", {
    token,
    user: { id: user.id, name: user.name, email: user.email },
  });
});

// Profile information (protected endpoint with JWT)
router.get("/me", async (req, res) => {
  const token = req.headers.authorization?.split(" ")[1];
  if (!token) return R.unauthorized(res, "Token missing.");

  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    const [rows] = await db.query(
      "SELECT id, name, email, created_at FROM users WHERE id = ?",
      [decoded.id]
    );
    return R.ok(res, "Profile information successfully retrieved!", rows[0]);
  } catch (err) {
    return R.unauthorized(res, "Invalid token.");
  }
});

module.exports = router;
