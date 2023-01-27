global.TextEncoder = require("util").TextEncoder; global.TextDecoder = require("util").TextDecoder
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/mydatabase";
//var url = "mongodb+srv://bibiefrat:a3bAcd01@cluster0.mnem9gq.mongodb.net/?retryWrites=true&w=majority";

MongoClient.connect(url, function(err, db) {
  if (err) throw err;
  var dbo = db.db("mydb");
  var myobj = { name: "Company Inc", address: "Highway 37" };
  dbo.collection("customers").insertOne(myobj, function(err, res) {
    if (err) throw err;
    console.log("1 document inserted");
    db.close();
  });
}); 
