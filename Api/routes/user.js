const express = require('express')
const { addUser, login } = require('../controllers/user.js')
const router = express.Router()
// const { getfewerOrders, getUserExpend } = require("../controllers/orders")

// router.route('/fewerOrders').get(getfewerOrders)
// router.route('/userExpend').get(getUserExpend)

router.route('/addUser').post(addUser)
router.route('/login').post(login)

module.exports = router