const express = require('express');
// const mongoose = require('mongoose');
const seller = require('../models/seller')

const addSeller = (req, res) => {
    const new_seller = new seller({
        "name": req.body.name
    })
    new_seller.save().then((result) => {
        res.send(result)
    }).catch((error) => {
        res.send(error)
    })
}
module.exports = { addSeller }