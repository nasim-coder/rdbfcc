const User = require('../model/user')
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const jwtconfig = require('../config/jwtconfig')
const Store = require('../model/store');
const mongoose = require('mongoose');
const BookStock = require('../model/bookStock')

//user register
exports.register = async (req, res) => {

    const { name, email, password } = req.body;
    let isAlreadyexist = await User.findOne({ email });
    if (!isAlreadyexist) {
        let user = new User({
            name: name,
            email: email,
            password: bcrypt.hashSync(password, 8)
        });
        user.save((err, user) => {
            if (err) {
                return res.status(500).send({ success: false, message: err })
            
            }
            return res.status(200).json('you are registered successfully')
        });
    } else {
        return res.status(501).send({msg: 'user already exist', success: false});
    }
        
};


//login function for the user and assigning token
exports.login = async (req, res) => {
    const { email, password } = req.body;
    if (!(email && password)) {
        res.status(400).send("All input is required");
    }
    const user = await User.findOne({ email });
    let isPasswordCorrect = await bcrypt.compare(password, user.password);
    if (user && (isPasswordCorrect)) {
        const token = jwt.sign({ user }, jwtconfig.secret, { "expiresIn": "2h" });
        user.token = token;
        res.status(200).json(user)
    } else {
        res.status(400).send({msg: "invalid credential"})
    }
}

//create store if it deoesnt exist
exports.createStore = async (req, res) => {
    const { storename} = req.body;
    let userid = mongoose.Types.ObjectId(req.params);
    //check if the user already has store
    let isStoreExist = await Store.findOne({ owner: userid })
    //create store object
    let store = new Store({
        storename: storename,
        owner: userid
    });

    if (!isStoreExist) {
        await store.save((err, stock) => {
            if (err) {
                return res.status(500).send({msg:err.message})
            } else {
                return res.status(200).send({msg: 'Store created successfully'})
            }
        })
    } else {
        return res.status(501).send({msg:'you already have a store'}, isStoreExist)
    }
};

//add stock in the store if the user has a store and same stock is not available in his store
exports.addStock = async (req, res) => {
    const {bookname, author, price, isbn} = req.body;
    console.log(req.params);
    let storeid = mongoose.Types.ObjectId(req.params.store_id)
    let userid = mongoose.Types.ObjectId(req.params.id)
    //check if the user already has store
    let isStoreExist = await Store.findOne({ owner: userid })
    console.log(isStoreExist);
    //create bookStock object
    let bookStock = new BookStock({
        owner: userid,
        bookname: bookname,
        author: author,
        price: price,
        store: storeid,
        isbn:1
    })
    if (isStoreExist) {
       await bookStock.save((err, bookStock) => {
            if (err) {
                return res.status(500).send({msg:err.message})
            }
            else {
                //adding the id of the book stock to the store
                isStoreExist.stock.push(bookStock.id);
                isStoreExist.save();
                return res.status(200).send({msg: 'stock created successfully', bookStock})
            }
        })
    } else {
        return res.status(501).send({msg: 'Please create store first'})
    }
};

//user add book in the exact stock if store and stock available and if the user is valid.
exports.addbookInStock = async (req, res) => {
    
    let stockid = mongoose.Types.ObjectId(req.params.stock_id)
    console.log(stockid);
    let bookstock = await BookStock.find({stockid });
    console.log(bookstock[0].isbn);
    let isbnn = req.body.isbndata;
    // console.log(isbnn);
    await bookstock[0].isbn.push(isbnn);
   bookstock.save()
    return res.status(200).send({msg: 'inserted book successfully', isbnn})

};

//valid store and stock holder delte a book
exports.deleteBookfromStock = async (req, res) => {
    let isbn = req.params.isbn;
    let stocki_d = mongoose.Types.ObjectId(req.params.stockid);
    let sbc = await BookStock.updateOne({ _id: stocki_d }, { $pop: { isbn: 1 } })
    BookStock.save();
};

//a normal user can see all the stores irrespective of the owner
exports.viewStores = async (req, res) => {
    let store = await Store.find({});
    if (store) {
        return res.status(200).send(store)
    } else {
        return res.status(404).send({msg:'no store found'})
    }
}

//a normal user can see the available books in the store irrespective of the owner
exports.viewStock = async (req, res) => {
    let storeid = mongoose.Types.ObjectId(req.body.params);
    let stocks = await BookStock.find({ storeid });
    if (stocks) {
       return res.status(200).send(stocks)
    } else {
        return res.status(404).send({msg:'no stock found'})
    }
}

