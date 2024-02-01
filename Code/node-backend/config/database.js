const { Pool } = require("pg");
require("dotenv").config();
const pool = new Pool({
  user: process.env.DATABASEUSER,
  host: process.env.DATABASEHOST,
  database: process.env.DATABASENAME,
  password: process.env.DATABASEPASSWORD,
  port: process.env.DATABASEPORT,
});

const Connection = () => {
  pool
    .connect()
    .then(() => {
      console.log("Connected to PostgreSQL database!");
    })
    .catch((err) => {
      console.error("Error connecting to the database:", err);
    });
};
module.exports = {
  Connection,
  query: (text, params) => pool.query(text, params),
};
