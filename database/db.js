const config = require("../config.js");
const { createPool } = require("mysql2/promise");

const pool = createPool({
  host: `${config.DB_HOST}`,
  database: `${config.DB_DATABASE}`,
  password: `${config.DB_PASSWORD}`,
  port: `${config.DB_PORT}`,
  user: `${config.DB_USER}`,
});

module.exports = pool;
