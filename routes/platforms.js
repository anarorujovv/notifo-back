const express = require("express");
const { listPlatforms } = require("../controllers/platformsController");

const router = express.Router();

// Public endpoint: GET /api/platforms
router.get("/", listPlatforms);

module.exports = router;



