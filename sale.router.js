var express = require('express');
var db = require('./pgp');
var router = express.Router();


router.post('/', ( req, res ) => {

var parametr = req.body.name;

	n = parametr.length;
	var upperResult = parametr[0].toUpperCase(); 
	var str = parametr.substring(1,n);
	var local = upperResult + str;

var data = JSON.stringify({ "mark": local});

 db.func( 'tst.selling', data)
	.then( function( rs ){ 
		
		var list = rs[0]['selling']

		for( var summ = i = 0; i < list.length; i++ ){
			summ += list[i].cost;
		}
list.push(summ )

			console.log(list)

		return res.json( list )

	}).catch( function( err ){

		res.statusCode = 500;
		return res.json(err);

	});

});
module.exports = router;