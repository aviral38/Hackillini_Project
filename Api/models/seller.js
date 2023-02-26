const mongoose = require("mongoose");

const sellersSchema = new mongoose.Schema({
    uid: {
        type: String,
        required: true

    },
    name: {
        type: String,
        required: true
    },
    items: {
        type: []
    }
})

module.exports = mongoose.model('sellers', sellersSchema);