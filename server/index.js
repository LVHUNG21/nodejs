
console.log("Hello, World");
const express=require('express')
const mongoose=require('mongoose');
//import 'package:express/express.dart';
const PORT=3000;
const app=express();
const DB='mongodb+srv://hung:hung12345@cluster0.kwtewnv.mongodb.net/?retryWrites=true&w=majority';
const authRouter=require('./routes/auth');
//Client-> middware -> SERVER -> Client;
//middware
app.use(express.json());
app.use(authRouter);
app.use(productRouter);
app.user(userRouter);
app.use(adminRouter);

//conections
mongoose.set('strictQuery',false);
mongoose.connect(DB).then(()=>{
    console.log('connection Successful');
}).catch(e =>{
    console.log(e);
})
//import 'package:flutter/screens/auth.dart'
//Creating an api
// GET, PUT, POST, DELETE, UPDATE ->CRUD
//http://<youripaddress>/hello-world
//app.get('/',(req,res)=>{
//res.json({name:"HUNG"});
//})
//app.get('/hello-world',(req,res)=>{
// res.send('hello-world');
//})
app.listen(PORT,"0.0.0.0",()=>{
console.log(`connect at port ${PORT}`);
});

