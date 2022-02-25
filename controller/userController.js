const User = require('../model/user')
const bcrypt = require('bcryptjs');
const jwt = require('json-web-token');
const jwtconfig = require('../config/jwtconfig')
const Store = require('../model/store');
const { default: mongoose } = require('mongoose');

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
        res.status(400).send("invalid credential")
    }
}

//create store if it deoesnt exist
exports.createStore = async (req, res) => {
    const { storename, id } = req.body;
    let userid = mongoose.Types.ObjectId(id);
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
exports.addStock = (req, res) => {
    const {id, }
    let userid = mongoose.Types.ObjectId(id)
    //check if the user already has store
    let isStoreExist = await Store.findOne({ owner: userid })
    
};

//user add book in the exact stock if store and stock available and if the user is valid.
exports.updateStock = (req, res) => {
    
};

//valid store and stock holder delte a book
exports.deleteBookfromStock = (req, res) => {
    
};

//a normal user can see all the stores irrespective of the owner
exports.viewStores = (req, res) => {
    
}

//a normal user can see the available books in the store irrespective of the owner
exports.viewStock = (req, res) => {
    
}

