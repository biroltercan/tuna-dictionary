var crypto = require('crypto')
var db=require('./db')
var cookieParser=require('cookie-parser')

exports.tokenToUid=function(req,res,next){
	var token =req.cookies.token||req.body.token

	db.query("SELECT userid FROM token WHERE token=?",[token],function(err,row){
		if(!row[0]){
			res.send("Unauthorized Request")
			return
		}
		var userid=row[0].userid
		req.userid=userid
		next()
	})
}

exports.send = function (res, code, message, payload) {
	if(!payload) {
		payload = {}
	}
	res.send({code: code, message: message, payload: payload})
}

exports.randomString = function(len){
	return crypto.randomBytes(Math.floor(len/2)).toString('hex')
}