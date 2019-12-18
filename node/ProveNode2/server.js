var express = require("express00");

var app = express();

app.get("/", function(req, res){
    console.log("Recieved a request for the /");

    res.write("This is the root");
    res.end();
});

app.get("/home", function(req, res){
    console.log("Recieved a request for the home page");

    res.write("this is the homepage");
    res.end;
});

app.listen(5000, function(){
    console.log("The server is up and listening on port 5000");
});