const express = require('express')
const mongoose = require("mongoose");
const app = express()
const bodyParser = require('body-parser')
const item = require('./routes/items.js')
const seller = require('./routes/seller.js')
const user = require('./routes/user.js')
const request = require('./routes/request.js')
//Remember to remove password from here between : and @//s
const uri = 'mongodb+srv://Satrou_Gojo:${password}@hackillini.xlgri8j.mongodb.net/?retryWrites=true&w=majority'
async function connect() {
    try {
        await mongoose.connect(uri)
        console.log('connected to mongo')
    }
    catch (error) {
        console.log(error)
    }
}

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.use(bodyParser.json())

app.use('/item', item)
app.use('/seller', seller)
app.use('/user', user)
app.use('/request', request)

app.get('/', (req, res) => {
    res.send("welcome")
})
//var port = 8000
connect()
app.listen(process.env.PORT || 8000, () => {
    console.log("hosted")
})