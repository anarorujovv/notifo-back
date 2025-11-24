const express = require("express");
const { listCategories } = require("../controllers/categoriesController");

const router = express.Router();

// Public endpoint: GET /api/categories
router.get("/", listCategories);

module.exports = router;


