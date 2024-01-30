const query = require("../config/database.js");
const register = async (req, res) => {
  const { username, email, password } = req.body;
  try {
    const { rows } = await query.query(
      "SELECT * FROM users WHERE username=($1) OR email=($2)",
      [username, email]
    );
    if (rows.length == 0) {
      const { rows } = await query.query(
        "INSERT INTO users (username, email, password) VALUES ($1, $2, $3)",
        [username, email, password]
      );
      res
        .status(201)
        .json({ message: "User Successfully registered", rows: rows });
    } else {
      res.status(409).json({ message: "User Already Exists" });
    }
  } catch (error) {
    res.status(500).json({ message: `${error.message}` });
  }
};

module.exports = { register };
