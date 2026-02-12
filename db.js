const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "notifo29092006",
  database: "notifo",
});

module.exports = pool;
