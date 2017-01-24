var app=require('express')()
var bodyParser=require('body-parser')
var db=require('./db')
var util=require('./util')
var cookieParser=require('cookie-parser')

app.use(bodyParser.urlencoded())
app.use(cookieParser())
app.engine('html', require('ejs').renderFile)
app.use(require('express').static("public"))

app.get("/",function(req,res){
	res.render("index.html")
})

app.get("/login",function(req,res){
	res.render("login.html")
})

app.get("/register",function(req,res){
	res.render("register.html")
})

app.get("/profile",function(req,res){
	res.render("profile.html")
})

app.get("/user/:username",function(req,res){
	var username=req.params.username
	res.render("user.html",{username:username})
})

app.get("/entry/:entryid",function(req,res){
	var entryid=req.params.entryid
	res.render("entry.html",{entryid:entryid})
})

app.get("/topic/:topicid",function(req,res){
	var topicid=req.params.topicid
	var page=1
	res.render("topic.html",{topicid:topicid,page:page})
})

app.get("/topic/:topicid/:page",function(req,res){
	var topicid=req.params.topicid
	page=req.params.page
	res.render("topic.html",{topicid:topicid,page:page})
})

app.get("/newTopic/:topicname",function(req,res){
	var topicname=req.params.topicname
	res.render("newTopic.html",{topicname:topicname})
})

app.post("/login",function(req,res){
	var body=req.body
	var username=body.username
	var password=body.password
	db.query("SELECT * FROM user WHERE username=? AND password=?",[username,password],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		if(row[0]){
			var userid=row[0].id
			var username=row[0].username
			var token=util.randomString(30)
			db.query("INSERT INTO token (token,userid) VALUES(?,?)",[token,userid],function(err,row){
				if(err){
					util.send(res,404,"Database Error")
				}
				util.send(res,200,"Connection Succesfull",{userid:userid,token:token,username:username})
			})
		}
		else{
			util.send(res,404,"Connection Failed")
		}
	})
})

app.post("/register",function(req,res){
	var body=req.body
	var username=body.username.replace(/(<([^>]+)>)/ig,"")
	var password=body.password
	var mail=body.mail
	var d=new Date()
	var month=d.getMonth()+1
	var date=d.getFullYear()+"-"+month+"-"+d.getDate()

	if(!username||!password||!mail){
		util.send(res,404,"Some informations are empty.")
	}

	db.query("INSERT INTO user (username,password,mail,roleid,created_at) VALUES(?,?,?,1,?)",[username,password,mail,date],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
			util.send(res,200,"Register Succesfull")
	})
})

app.post("/newTopic",util.tokenToUid,function(req,res){
	var body=req.body
	var userid=req.userid
	var name=body.name.replace(/(<([^>]+)>)/ig,"")
	var content=body.content.replace(/(<([^>]+)>)/ig,"")
	var d=new Date()
	var month=d.getMonth()+1
	var date=d.getFullYear()+"-"+month+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()

	if(!content){
		util.send(res,404,"Content can not null.")
	}

	db.query("INSERT INTO topic (name) VALUES (?)",[name],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		var topicid=row.insertId
		db.query("INSERT INTO entry (content,topicid,userid,created_at) VALUES (?,?,?,?)",[content,topicid,userid,date],function(err,row){
			if(err){
				util.send(res,404,"Database Error")
			}
			util.send(res,200,"Topic succesfully added.",{topicid:topicid})
		})
	})
})

app.post("/newEntry",util.tokenToUid,function(req,res){
	var body=req.body
	var content=body.content.replace(/(<([^>]+)>)/ig,"")
	var topicid=body.topicid
	var userid=req.userid
	var d=new Date()
	var month=d.getMonth()+1
	var date=d.getFullYear()+"-"+month+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()

	if(!content){
		util.send(res,404,"Content can not null.")
	}

	db.query("INSERT INTO entry (content,topicid,userid,created_at) VALUES (?,?,?,?)",[content,topicid,userid,date],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"Entry succesfully added.")
	})
})

app.post("/editEntry",util.tokenToUid,function(req,res){
	var body=req.body
	var entryid=body.entryid
	var content=body.content.replace(/(<([^>]+)>)/ig,"")
	var userid=req.userid
	var d=new Date()
	var month=d.getMonth()+1
	var date=d.getFullYear()+"-"+month+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()

	if(!content){
		util.send(res,404,"Content can not null.")
	}

	db.query("UPDATE entry SET content=?,updated_at=? WHERE id=? AND userid=?",[content,date,entryid,userid],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"Entry succesfully updated.")
	})
})

app.post("/deleteEntry",util.tokenToUid,function(req,res){
	var body=req.body
	var entryid=body.entryid
	var userid=req.userid

	db.query("DELETE FROM entry WHERE id=? AND userid=?",[entryid,userid],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"Entry succesfully deleted.")
	})
})

app.post("/favEntry",util.tokenToUid,function(req,res){
	var body=req.body
	var entryid=body.entryid
	var userid=req.userid
	var d=new Date()
	var month=d.getMonth()+1
	var date=d.getFullYear()+"-"+month+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()

	db.query("INSERT INTO fav (userid,entryid,created_at) VALUES (?,?,?)",[userid,entryid,date],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"Entry succesfully added to favs.")
	})
})

app.post("/unfavEntry",util.tokenToUid,function(req,res){
	var body=req.body
	var entryid=body.entryid
	var userid=req.userid

	db.query("DELETE FROM fav WHERE entryid=? AND userid=?",[entryid,userid],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"Entry succesfully deleted to favs.")
	})
})

app.post("/listEntryFavUser",function(req,res){
	var entryid=req.body.entryid

	db.query("SELECT u.id as 'userid', u.username as 'username',e.id as 'entryid' FROM fav f "+
		"INNER JOIN user u ON f.userid=u.id INNER JOIN entry e ON e.id=f.entryid WHERE e.id=? "+
		"ORDER BY e.created_at DESC",[entryid],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"OK",{res:row})
	})
})

app.post("/listEntryForTopicGuest",function(req,res){
	var topicid=req.body.topicid
	var page=req.body.page*10-10

	db.query("SELECT t.id as 'topicid',t.name as 'topicname',e.id as 'entryid',e.content as 'entrycontent',"+
		"u.username as 'entryauthor',e.created_at as 'entrycreatedat',e.updated_at as 'entryupdatedat',"+
		"COUNT(f.entryid) as 'entryfavcount' FROM topic t INNER JOIN entry e ON t.id=e.topicid "+
		"INNER JOIN user u ON e.userid=u.id LEFT JOIN fav f ON f.entryid=e.id GROUP BY e.id HAVING t.id=? ORDER BY e.created_at ASC "+
		"LIMIT 10 OFFSET ?",
		[topicid,page],function(err,row){
			if(err){
				util.send(res,404,"Database Error")
			}
			util.send(res,200,"OK",{res:row})
	})
})

app.post("/listEntryForTopicUser",util.tokenToUid,function(req,res){
	var userid=req.userid
	var topicid=req.body.topicid
	var page=req.body.page*10-10

	db.query("SELECT t.id as 'topicid',t.name as 'topicname',e.id as 'entryid',e.content as 'entrycontent',"+
		"u.username as 'entryauthor',u.id as 'userid',e.created_at as 'entrycreatedat',e.updated_at as 'entryupdatedat',"+
		"COUNT(f.entryid) as 'entryfavcount',(SELECT COUNT(1) FROM fav WHERE entryid=e.id AND userid=?) as 'isFav' "+
		"FROM topic t INNER JOIN entry e ON t.id=e.topicid INNER JOIN user u ON e.userid=u.id LEFT JOIN fav f ON f.entryid=e.id "+
		"GROUP BY e.id HAVING t.id=? ORDER BY e.created_at ASC LIMIT 10 OFFSET ?",[userid,topicid,page],function(err,row){
			if(err){
				util.send(res,404,"Database Error",{err:err})
			}
			util.send(res,200,"OK",{res:row})
		})
})

app.post("/dailyLeftFrame",function(req,res){
	var d=new Date()
	var month=d.getMonth()+1
	if(month<10) month="0"+month
	var date=d.getFullYear()+"-"+month+"-"+d.getDate()

	db.query("SELECT t.id as 'topicid',t.name as 'topicname',COUNT(e.topicid) as 'entrycountfortopic' "+
		"FROM topic t INNER JOIN entry e ON t.id=e.topicid WHERE e.created_at LIKE ? GROUP BY t.id ORDER BY e.created_at DESC",
		[date+"%"],function(err,row){
			if(err){
				util.send(res,404,"Database Error")
			}
			util.send(res,200,"OK",{res:row})
		})
})

app.post("/popularLeftFrame",function(req,res){
	var d=new Date()
	var month=d.getMonth()+1
	if(month<10) month="0"+month
	var date=d.getFullYear()+"-"+month+"-"+d.getDate()
	var yesterday=d.getDate()-1
	var dateyesterday=d.getFullYear()+"-"+month+"-"+yesterday

	db.query("SELECT t.id as 'topicid',t.name as 'topicname',COUNT(e.topicid) as 'entrycountfortopic' "+
		"FROM topic t INNER JOIN entry e ON t.id=e.topicid WHERE e.created_at LIKE ? OR e.created_at LIKE ? "+
		"GROUP BY t.id HAVING COUNT(e.topicid)>7 ORDER BY e.created_at DESC",
		[date+"%",dateyesterday+"%"],function(err,row){
			if(err){
				util.send(res,404,"Database Error")
			}
			util.send(res,200,"OK",{res:row})
		})
})

app.post("/search",function(req,res){
	var word=req.body.word.replace(/(<([^>]+)>)/ig,"")

	db.query("SELECT * FROM topic WHERE name LIKE ? ORDER BY id LIMIT 5",[word+"%"],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"OK",{res:row})
	})
})

app.post("/getTopic",function(req,res){
	var word=req.body.word.replace(/(<([^>]+)>)/ig,"")

	db.query("SELECT * FROM topic WHERE name=?",[word],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"OK",{res:row})
	})
})

app.post("/getEntryForGuest",function(req,res){
	var entryid=req.body.entryid

	db.query("SELECT t.id as 'topicid',t.name as 'topicname',e.id as 'entryid',e.content as 'entrycontent',"+
		"u.username as 'entryauthor',e.created_at as 'entrycreatedat',e.updated_at as 'entryupdatedat',"+
		"COUNT(f.entryid) as 'entryfavcount' FROM topic t INNER JOIN entry e ON t.id=e.topicid "+
		"INNER JOIN user u ON e.userid=u.id LEFT JOIN fav f ON f.entryid=e.id GROUP BY e.id HAVING e.id=?",[entryid],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"OK",{res:row})
	})
})

app.post("/getEntryForUser",util.tokenToUid,function(req,res){
	var entryid=req.body.entryid
	var userid=req.userid

	db.query("SELECT t.id as 'topicid',t.name as 'topicname',e.id as 'entryid',e.content as 'entrycontent',"+
		"u.username as 'entryauthor',u.id as 'userid',e.created_at as 'entrycreatedat',e.updated_at as 'entryupdatedat',"+
		"COUNT(f.entryid) as 'entryfavcount',(SELECT COUNT(1) FROM fav WHERE entryid=e.id AND userid=?) as 'isFav' "+
		"FROM topic t INNER JOIN entry e ON t.id=e.topicid INNER JOIN user u ON e.userid=u.id LEFT JOIN fav f ON f.entryid=e.id "+
		"GROUP BY e.id HAVING e.id=?",[userid,entryid],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"OK",{res:row})
	})
})

app.post("/randomEntries",function(req,res){
	db.query("SELECT t.id as 'topicid',t.name as 'topicname',e.id as 'entryid', e.content as 'entrycontent',"+
		"e.created_at as 'entrycreatedat',e.updated_at as 'entryupdatedat',u.id as 'userid',u.username as 'entryauthor' "+
		"FROM topic t INNER JOIN entry e ON t.id=e.topicid INNER JOIN user u ON u.id=e.userid ORDER BY RAND() LIMIT 5",function(err,row){
			if(err){
				util.send(res,404,"Database Error")
			}
			util.send(res,200,"OK",{res:row})
		})
})

app.post("/totalEntryCountForTopic",function(req,res){
	var topicid=req.body.topicid
	db.query("SELECT COUNT(*) as COUNT FROM entry WHERE topicid=?",[topicid],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		util.send(res,200,"OK",{res:row})
	})
})

app.post("/getUserId",function(req,res){
	var username=req.body.username
	db.query("SELECT id FROM user WHERE username=?",[username],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		var userid=null
		if(row[0]){
			userid=row[0].id
		}
		util.send(res,200,"OK",{userid:userid})
	})
})

app.post("/getUserEntries",function(req,res){
	var userid=req.body.userid
	db.query("SELECT (SELECT COUNT(*) FROM entry WHERE created_at > DATE_SUB(NOW(), INTERVAL 1 DAY) AND userid=?) as 'last24hours',"+
		"(SELECT COUNT(*) FROM entry WHERE created_at > DATE_SUB(NOW(), INTERVAL 1 WEEK) AND userid=?) as 'last7days',"+
		"(SELECT COUNT(*) FROM entry WHERE created_at > DATE_SUB(NOW(), INTERVAL 1 MONTH) AND userid=?) as 'last30days',"+
		"(SELECT COUNT(*) FROM entry WHERE userid=?) as 'sum'",[userid,userid,userid,userid],function(err,row){
		if(err){
			util.send(res,404,"Database Error")
		}
		var res0=row
		db.query("SELECT t.name as 'topicname',e.id as 'entryid' FROM entry e INNER JOIN topic t ON e.topicid=t.id WHERE e.userid=? "+
			"ORDER BY e.id DESC",[userid],function(err,row){
			if(err){
				util.send(res,404,"Database Error")
			}
			var res1=row
			db.query("SELECT t.name as 'topicname',e.id as 'entryid' FROM entry e INNER JOIN topic t ON e.topicid=t.id "+
				"INNER JOIN fav f ON f.entryid=e.id WHERE e.userid=? GROUP BY f.entryid ORDER BY COUNT(f.entryid) DESC",[userid],function(err,row){
				if(err){
					util.send(res,404,"Database Error")
				}
				var res2=row
				db.query("SELECT t.name as 'topicname',e.id as 'entryid' FROM entry e INNER JOIN fav f ON e.id=f.entryid "+
					"INNER JOIN user u ON u.id=e.userid INNER JOIN topic t ON t.id=e.topicid "+
					"WHERE f.userid=? ORDER BY f.created_at DESC",[userid],function(err,row){
					if(err){
						util.send(res,404,"Database Error")
					}
					var res3=row
					util.send(res,200,"OK",{res:res0,res1:res1,res2:res2,res3:res3})
				})
			})
		})
	})
})

app.listen(5555)