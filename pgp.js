
var pgp = require('pg-promise')();
var cn = require('./db');

module.exports = pgp( cn );
