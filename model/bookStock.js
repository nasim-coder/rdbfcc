const mongoose = require('mongoose');

let bookStockSchema = new mongoose.Schema({
    owner: {
        type: mongoose.Types.ObjectId,
        required: true,
        ref: 'User'
    },
    bookname: {
        type: String,
        required: true
    },
    author: {
        type: String,
        required: true
    },
    price: {
        type: Number,
        required: true
    },
    isbn: [{
        type: Number,
        unique: true
    }],
});

let BookStock = mongoose.model('BookStock', bookStockSchema);
module.exports = BookStock;