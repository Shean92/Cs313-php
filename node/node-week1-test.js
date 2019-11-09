const http = require('http');
const url = require('url');
const fs = require('fs');
var jsonData = '{"name": "Shean Brunner", "class": "cs313"}';
var jsonObj = JSON.parse(jsonData);
console.log(jsonObj);
 
// stringify JSON Object
var jsonContent = JSON.stringify(jsonObj);
console.log(jsonContent);

//connect to http
const server = http.createServer(function (req, res) {
    var parsedURL = url.parse(req.url, true);
    console.log(parsedURL);
    if(req.url == '/home') {
        res.writeHead(200, {'Content-Type': 'text/html'});
        res.write('<h1>Welcome to the Home Page</h1>');
        res.end();
    }
    else {
        res.writeHead(404, {'Content-Type': 'text/html'});
        res.write('<h1>Page Not Found</h1>');
        res.end();
    }
}).listen(8888);