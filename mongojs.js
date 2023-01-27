global.TextEncoder = require('util').TextEncoder
const { MongoClient, ServerApiVersion } = require('mongodb');
//const uri = "mongodb+srv://bibiefrat:a3bAcd01@cluster0.mnem9gq.mongodb.net/?retryWrites=true&w=majority";
const uri = process.argv[2]
console.log(uri)
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true, serverApi: ServerApiVersion.v1 });
async function run() {
  try {
    const database = client.db('bibidb');
    const collec = database.collection('bibi_data');
    // Query for a movie that has the title 'Back to the Future'
    var myobj = { _id: 723 , title: "bibi_title", name: "Company Inc", address: "Highway 37" };
    await collec.insertOne(myobj);
    const query = { title: 'bibi_title' };
    //const query = { _id: 7020 };
    const data = await collec.findOne(query);
    console.log(data);
    await collec.deleteOne(query);
  } finally {
    // Ensures that the client will close when you finish/error
    await client.close();
  }
}
run().catch(console.dir);
