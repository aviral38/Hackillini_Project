const { Decimal128 } = require("mongodb");
const mongoose = require("mongoose");

const itemSchema = new mongoose.Schema({
    isActive: {
        type: Boolean,
        required: true
    },
    cost: {
        type: Decimal128,
        required: true,
    },
    itemName: {
        type: String,
        required: true
    },
    sellerName: {
        type: String,
        required: true
    },
    sellerId: {
        type: mongoose.Schema.Types.Mixed,
        required: true
    },
    picture: {
        type: String,
        required: true
    },
    description: {
        type: String,
    },
    longitude: {
        type: Decimal128,
        required: true
    },
    latitude: {
        type: Decimal128,
        required: true
    }
})

module.exports = mongoose.model('item', itemSchema);