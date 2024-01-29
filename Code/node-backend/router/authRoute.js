const router = require("express").Router();
const { register } = require("../controller/register.js");
const { login } = require("../controller/login.js");

router.post("/register", register);
router.post("/login", login);

module.exports = router;
