var express = require('express');
var db = require('./pgp');
var router = express.Router();


router.post('/', ( req, res ) => {

var data = JSON.stringify({ "mark": 'Королева'});

 db.func( 'tst.selling', data)
	.then( function( rs ){ 
		
		var list = rs[0]['selling']
		return res.json( list )

	}).catch( function( err ){

		res.statusCode = 500;
		return res.json(err);

	});

});
module.exports = router;