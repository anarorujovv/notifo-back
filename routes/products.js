const express = require("express");
const { fetchTapazToday } = require("../controllers/productsController");
const auth = require("../middleware/auth");

const router = express.Router();

// POST /api/products/tapaz/today - fetch today's Tap.az products by filters
// Body: { name: string, min_price?: number, max_price?: number }
router.post("/tapaz/today", async (req, res) => {
  await fetchTapazToday(req, res);
});

module.exports = router;
