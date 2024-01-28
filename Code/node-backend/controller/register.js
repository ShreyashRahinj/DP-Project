const query = require("../config/database.js");
const register = async (req, res) => {
  const { email, password } = req.body;
  try {
    const { rows } = await query.query(
      "INSERT INTO users (email, password) VALUES ($1, $2)",
      [email, password]
    );
    res.status(201).json({ message: "Zhale ekdache", rows: rows });
  } catch (error) {
    res.status(500).json({ message: `${error.message}` });
  }
};

module.exports = { register };
