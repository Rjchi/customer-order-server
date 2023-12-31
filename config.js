const { config } = require("dotenv");

config();

/**-----------------------
 * Variables de entorno
 -----------------------*/

const PORT = process.env.PORT;

const DB_HOST = process.env.DB_HOST;
const DB_USER = process.env.DB_USER;
const DB_DATABASE = process.env.DB_DATABASE;
const DB_PASSWORD = process.env.DB_PASSWORD;
const DB_PORT = process.env.DB_PORT;

const ORIGEN = process.env.ORIGEN;

const JWT_SECRET_KEY = process.env.JWT_SECRET_KEY;

module.exports = {
  PORT,
  DB_HOST,
  DB_USER,
  DB_DATABASE,
  DB_PASSWORD,
  DB_PORT,
  ORIGEN,
  JWT_SECRET_KEY
};
