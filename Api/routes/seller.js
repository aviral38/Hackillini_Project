const express = require('express')
const { addSeller } = require('../controllers/seller.js')
const router = express.Router()
// const { getfewerOrders, getUserExpend } = require("../controllers/orders")

// router.route('/fewerOrders').get(getfewerOrders)
// router.route('/userExpend').get(getUserExpend)

router.route('/addSeller').post(addSeller)

module.exports = router