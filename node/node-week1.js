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
    }
    else if(req.url == '/getData') {
        res.writeHead(200, {'Content-Type': 'application/json'});
        fs.writeFile("output.json", jsonContent, 'utf8', function (err) {
            if (err) {
                console.log("An error occured while writing JSON Object to File.");
                return console.log(err);
            }
            console.log("JSON file has been saved.");
        });
        fs.readFile("output.json", function(err, content) {
            if (err) {
                console.log("An error occured while reading JSON Object to File.");
                return console.log(err);
            }
            res.write(content);
        });
    }
    else {
        res.writeHead(404, {'Content-Type': 'text/html'});
        res.write('<h1>Page Not Found</h1>')
    }
    res.end();
}).listen(8888);