const query = require("../config/database.js");
const login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const { rows } = await query.query(
      "SELECT * FROM users WHERE email=($1) AND password=($2)",
      [email, password]
    );
    if (rows.length == 0) {
      res.status(404).json({ message: "User not found" });
    } else {
      res.status(200).json({ user: rows });
    }
  } catch (error) {
    res.status(500).json({ message: `${error.message}` });
  }
};

module.exports = { login };
