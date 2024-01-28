// Imports
const express = require("express");
const app = express();
const { Connection } = require("./config/database.js");
const authRoutes = require("./router/authRoute.js");
require("dotenv").config();

// Environment Variables
const PORT = process.env.PORT;

// Middlewares
app.use(express.json());
app.use("/api", authRoutes);

Connection();

app.listen(PORT, () => {
  console.log(`Server is listening on Port : ${PORT}`);
});
