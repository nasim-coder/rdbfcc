const mongoose = require('mongoose');

let storeSchema = new mongoose.Schema({
    storename: {
        type: String,
        required: true
    },
    owner: {
        type: mongoose.Types.ObjectId,
        required: true,
        unique: true
    },
    stock: [{
        type: mongoose.Types.ObjectId,
        ref: 'BookStock'
    }],
});

let Store = mongoose.model('Store', storeSchema);
module.eports = Store;