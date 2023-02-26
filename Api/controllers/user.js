const express = require('express');
// const mongoose = require('mongoose');
const user = require('../models/user')
const seller = require('../models/seller');

const addUser = (req, res) => {
    const new_user = new user({
        Name: req.body.name,
        Email: req.body.email,
        Password: req.body.password
    })
    new_user.save().then((result) => {
        const seller_add = new seller({
            uid: result.id,
            name: req.body.name,
            items: [],

        });
        seller_add.save().then((result1) => { console.log(result1); res.send(result); }).catch(err => { res.send(err) })


    }).catch((error) => { res.send(error) })
}

const login = (req, res) => {
    user.findOne({ "Email": req.body.email }).then((result) => {


        if (req.body.password == result['Password']) {
            console.log(result.id)
            res.status(200).send(result.id)
        }
        else {
            console.log(req.body.email)
            console.log(result)
            res.status(300).send("Wrong Password or email")
        }
    }).catch((error) => {
        res.status(400).send(error)
    })
}
module.exports = { addUser, login }