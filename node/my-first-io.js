// JavaScript source code
const fs = require('fs');
const content = fs.readFileSync(process.argv[2], 'utf8').split('\n').length - 1;
console.log(content);