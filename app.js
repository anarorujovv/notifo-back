const express = require("express");
const cors = require("cors");
const usersRoute = require("./routes/users");
const userPlatformsRoute = require("./routes/userPlatforms");
const categoriesRoute = require("./routes/categories");
const filtersRoute = require("./routes/filters");
const productsRoute = require("./routes/products");
const platformsRoute = require("./routes/platforms");
const cron = require("node-cron");
const { runFilterCron } = require("./services/cronService");
const filterWatcherService = require("./services/filterWatcherService");

const app = express();
app.use(cors());
app.use(express.json());

app.use("/api/users", usersRoute);
app.use("/api/user-platforms", userPlatformsRoute);
app.use("/api/categories", categoriesRoute);
app.use("/api/products", productsRoute);
app.use("/api/filters", filtersRoute);
app.use("/api/platforms", platformsRoute);

// Cron job: Run every 30 seconds
cron.schedule("*/30 * * * * *", () => {
  // runFilterCron();
});

app.listen(2009, () => {
  filterWatcherService().catch((err) => {
    console.error("[Watcher] Service terminated:", err);
  });
});
