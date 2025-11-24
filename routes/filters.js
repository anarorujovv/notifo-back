const express = require("express");
const { createFilter, listFilters, updateFilter, deleteFilter } = require("../controllers/filtersController");
const auth = require("../middleware/auth");

const router = express.Router();

// Create filter
router.post("/", auth, createFilter);

// List filters for current user
router.get("/", auth, listFilters);

// Update filter by id
router.patch("/:id", auth, updateFilter);

// Delete filter by id
router.delete("/:id", auth, deleteFilter);

module.exports = router;


