$(function() {
	var token=Cookies.get('token')
	var userid=Cookies.get('userid')
	if(token!=null){
		$(".logRegDiv").html("")
		$(".logRegDiv").prepend('<a href="/profile" class="btn btnLogReg">Profile</a>')
		$(".logRegDiv").prepend('<a href="#" class="btn btnLogReg" id="exit">Exit</a>')
	}
	$.post("/randomEntries",function(res){
		var data=res.payload.res
		var entries=$(".entries")
		entries.html("")
		for(var i=0;i<data.length;i++){
			if(data[i]==null){
				break
			}
			var enrtrydate=data[i].entrycreatedat
			enrtrydate=enrtrydate.replace("T"," ").replace(".000Z","")
			if(data[i].entryupdatedat!=null){
				enrtrydate+=" - "+data[i].entryupdatedat
				enrtrydate=enrtrydate.replace("T"," ").replace(".000Z","")
			}
			entries.append('<div class="panel panel-primary">'+
							  '<div class="panel-heading"><a href="/topic/'+data[i].topicid+'" style="color:white">'+data[i].topicname+'</a></div>'+
							  '<div class="panel-body" style="overflow-wrap: break-word;">'+data[i].entrycontent+'</div>'+
							  '<div class="panel-footer" style="white-space: nowrap;overflow: hidden;"><div style="float:right;"><u><a href="/user/'+data[i].entryauthor+'" style="color:black;font-weight:bold;">'+data[i].entryauthor+'</a></u>'+
							  ' <a href="/entry/'+data[i].entryid+'" style="color:black;font-size:11px;">'+enrtrydate+'</a></div></div>'+
							'</div>')
		}
	})
})