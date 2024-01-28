const router = require("express").Router();
const { register } = require("../controller/register.js");

router.post("/register", register);

module.exports = router;
