const express = require('express')
const { addItem, updateItemName, findItem, getAll } = require('../controllers/items.js')
const router = express.Router()
// const { getfewerOrders, getUserExpend } = require("../controllers/orders")

// router.route('/fewerOrders').get(getfewerOrders)
// router.route('/userExpend').get(getUserExpend)
router.route('/check').get((req, res) => { res.send("working") })
router.route('/addItem').post(addItem)
router.route('/updateItem').put(updateItemName)
router.route('/findItem').patch(findItem)
router.route('/getAll').patch(getAll)

module.exports = router