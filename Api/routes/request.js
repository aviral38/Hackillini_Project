const express = require('express')
const { makeRequest } = require('../controllers/request.js')
const router = express.Router()
// const { getfewerOrders, getUserExpend } = require("../controllers/orders")

// router.route('/fewerOrders').get(getfewerOrders)
// router.route('/userExpend').get(getUserExpend)

router.route('/addRequest').post(makeRequest)

module.exports = router