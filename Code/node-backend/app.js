// Imports
const express = require("express");
const app = express();
const { Pool } = require("pg");
require("dotenv").config();

// Environment Variables
const PORT = process.env.PORT;

const pool = new Pool({
  user: process.env.DATABASEUSER,
  host: process.env.DATABASEHOST,
  database: process.env.DATABASENAME,
  password: process.env.DATABASEPASSWORD,
  port: process.env.DATABASEPORT,
});

pool
  .connect()
  .then(() => {
    console.log("Connected to PostgreSQL database!");
  })
  .catch((err) => {
    console.error("Error connecting to the database:", err);
  });

// Middlewares
app.use(express.json());

app.listen(PORT, () => {
  console.log(`Server is listening on Port : ${PORT}`);
});
