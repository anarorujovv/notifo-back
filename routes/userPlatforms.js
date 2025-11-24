const express = require("express");
const {
  addPlatform,
  activatePlatform,
  deactivateById,
  deleteConnection,
  listUserPlatforms,
} = require("../controllers/userPlatformsController");
const auth = require("../middleware/auth");

const router = express.Router();

// POST /api/user-platforms/add -> create mapping only (requires auth)
router.post("/add", auth, addPlatform);

// POST /api/user-platforms/:id/active -> activate by user_platforms id (requires auth)
router.post("/:id/active", auth, activatePlatform);

// POST /api/user-platforms/:id/deactivate -> deactivate by user_platforms id (requires auth)
router.post("/:id/deactivate", auth, deactivateById);

// DELETE /api/user-platforms/:id
router.delete("/:id", auth, deleteConnection);

// GET /api/user-platforms -> list current user's platforms (requires auth)
router.get("/", auth, listUserPlatforms);

module.exports = router;
