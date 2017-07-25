var express = require('express');
var db = require('./pgp');
var router = express.Router();


router.post('/', ( req, res ) => {

 // res.send('hello');
var parametr = req.body.name;

	n = parametr.length;
	var upperResult = parametr[0].toUpperCase(); 
	var str = parametr.substring(1,n);
	var local = upperResult + str;
	
var data = JSON.stringify({"name": local});

 db.func( 'tst.boat_sale', data)
	.then( function( rs ){ 
		
		var list = rs[0]['boat_sale']
		return res.json( list )

	}).catch( function( err ){

		res.statusCode = 500;
		return res.json(err);

	});

});

module.exports = router;