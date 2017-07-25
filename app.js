var express = require('express');
var app = express();
var bodyParser = require('body-parser');

// parse application/x-www-form-urlencoded 
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

var boat = require('./boat.router');
var sale = require('./sale.router');

app.use('/static', express.static('public'));
app.use('/submit', boat);
app.use('/calculation', sale);

app.listen(8080, function () {
  console.log('Listening on port 8080!');
});

module.exports = app;
