const express = require('express');
// const mongoose = require('mongoose');
const request = require('../models/request');
const user = require('../models/user')

const makeRequest = async (req, res) => {
    var name = ''
    await user.findById(req.body.rid).then((result) => {
        console.log('ifjn')
        name = result['Name']

    })
    console.log(name)
    const new_request = new request({
        "rid": req.body.rid,
        "name": name,
        "item": req.body.item,
        "itemId": req.body.iid
    })
    new_request.save().then((result) => {
        res.send(result)
    }).catch((error) => {
        res.send(error)
    })
}

module.exports = { makeRequest }