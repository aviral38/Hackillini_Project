const express = require('express');
const item = require('../models/items.js')
const seller = require('../models/seller.js')

const addItem = (req, res) => {

    var body = req.body
    const new_item = new item({
        isActive: true,
        cost: req.body.cost,
        sellerName: req.body.sellerName,
        itemName: req.body.itemName,
        sellerId: req.body.sid,
        picture: req.body.picture,
        description: req.body.description,
        longitude: req.body.longitude,
        latitude: req.body.latitude
    })

    seller.find({ "uid": req.body.sid }).then((d) => {

        //d['items'].push(new_item.id)



        // );
        // if (typeof (d['items']) == 'undefined') {
        //     console.log("daiofn")
        //     data.push(new_item.id)
        // }
        // else {
        //     data = d['items']
        //     data.push(new_item.id)
        // }
        console.log(d)
        console.log(d[0]['name'])
        var data = d[0]['items']
        console.log(data)
        data.push(new_item.id)
        seller.findOneAndUpdate({ "uid": req.body.sid }, { 'items': data }).then(new_item.save().then(result => { res.status(200).json('item inserted successfully') }).catch(error => { res.send(error) })).catch((err) => { res.send(err) })


    }).catch((error) => { console.log(error) })
    // seller.findById(req.body.sid).then((d) => {
    //     console.log(data)
    //     console.log(d)

    // })


}

const getAll = (req, res) => {
    longitude = req.body.longitude,
        latitude = req.body.latitude,
        threshold = req.body.threshold,
        data = []
    item.find({}).then((data) => {
        console.log(parseFloat(data[0]['longitude']))
        data.forEach((res) => {
            d = distance(parseFloat(res['latitude']), parseFloat(res['longitude']), latitude, longitude, 'K')
            if (d < threshold) {



                data.push(res)

            }
        })

        res.send(data)
    }).catch((err) => {
        res.send(err)
    })
}

const updateItemName = (req, res) => {

    item.findByIdAndUpdate(req.body.id, { 'itemName': req.body.new_val }, (err, data) => {
        if (err) {
            res.send(err)
        }
        else {
            res.send("Successfully updated " + data)
        }
    })

}

const findItem = (req, res) => {
    longitude = req.body.longitude
    latitude = req.body.latitude
    threshold = req.body.threshold
    item.find({ 'itemName': { $regex: '.*' + req.body.name + '.*' } }).then((data) => {
        var d = []
        data.forEach((res) => {
            dis = distance(latitude, longitude, res['latitude'], res['longitude'], "K")
            if (dis < threshold) {
                d.push(res)
            }
        })
        res.send(d)
    }).catch((err) => {
        res.send(err)
    })
}

function distance(lat1, lon1, lat2, lon2, unit) {
    if ((lat1 == lat2) && (lon1 == lon2)) {
        return 0;
    }
    else {
        var radlat1 = Math.PI * lat1 / 180;
        var radlat2 = Math.PI * lat2 / 180;
        var theta = lon1 - lon2;
        var radtheta = Math.PI * theta / 180;
        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        if (dist > 1) {
            dist = 1;
        }
        dist = Math.acos(dist);
        dist = dist * 180 / Math.PI;
        dist = dist * 60 * 1.1515;
        if (unit == "K") { dist = dist * 1.609344 }
        if (unit == "N") { dist = dist * 0.8684 }
        return dist;
    }
}
module.exports = { addItem, updateItemName, findItem, getAll }