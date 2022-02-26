const express = require('express');
const mongoose = require('mongoose')
const userRouter = require('./route/userRoute')
const PORT = process.env.PORT || 8080;
const app = express();

mongoose.connect('mongodb://localhost:27017/bookInventry', () => {
    console.log('db connected');
})

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/user', userRouter);

app.listen(PORT, () => {
    console.log(`nodejs server is running on port: ${PORT}`);
})