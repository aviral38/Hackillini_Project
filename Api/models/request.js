const mongoose = require("mongoose");

const requestSchema = new mongoose.Schema({
    rid: {//requester id
        type: String,
        required: true

    },
    name: {
        type: String,
        required: true
    },
    item: {
        type: String,
        required: true
    },
    itemId: {
        type: String,
        required: true
    },
})

module.exports = mongoose.model('requests', requestSchema);