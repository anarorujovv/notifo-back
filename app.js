const express = require("express");
const cors = require("cors");
const http = require("http");
const { Server } = require("socket.io");
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
const server = http.createServer(app);
const io = new Server(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"]
  }
});

app.use(cors());
app.use(express.json());

app.use("/api/users", usersRoute);
app.use("/api/user-platforms", userPlatformsRoute);
app.use("/api/categories", categoriesRoute);
app.use("/api/products", productsRoute);
app.use("/api/filters", filtersRoute);
app.use("/api/platforms", platformsRoute);

// Socket.io connection handling
io.on("connection", (socket) => {
  console.log("A user connected:", socket.id);

  socket.on("join", (userId) => {
    socket.join(`user_${userId}`);
    console.log(`User ${userId} joined their notification room`);
  });

  socket.on("disconnect", () => {
    console.log("User disconnected");
  });
});

// Cron job: Run every 30 seconds
cron.schedule("*/30 * * * * *", () => {
  runFilterCron();
});

const PORT = 2009;
server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  
  // Start filter watcher and pass io instance
  filterWatcherService({ io }).catch((err) => {
    console.error("[Watcher] Service terminated:", err);
  });
});
