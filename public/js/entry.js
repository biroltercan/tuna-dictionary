$(function(){
	var token=Cookies.get('token')
	var userid=Cookies.get('userid')
	var entryid=$("#entryidDiv").text()

	if(token==null){
		$.post("/getEntryForGuest",{entryid:entryid},function(res){
			var data=res.payload.res[0]
			var entries=$(".entries")
			entries.html("")
			entries.prepend('<a href="/topic/'+data.topicid+'" style="font-size:20px;color:black;text-decoration: underline;margin-left:10px">'+data.topicname+'</a>')
			var enrtrydate=data.entrycreatedat
			enrtrydate=enrtrydate.replace("T"," ").replace(".000Z","")
			if(data.entryupdatedat!=null){
				enrtrydate+=" - "+data.entryupdatedat
				enrtrydate=enrtrydate.replace("T"," ").replace(".000Z","")
			}
				entries.append('<div class="panel panel-primary">'+
								  '<div class="panel-body" style="overflow-wrap: break-word;">'+data.entrycontent+'</div>'+
								  '<div class="panel-footer" style="white-space: nowrap;overflow: hidden;">Fav:<u class="favCountBtn" style="cursor:pointer" entryid="'+data.entryid+'">'+data.entryfavcount+
								  '</u><div style="float:right;"><u><a href="/user/'+data.entryauthor+'" style="color:black;font-weight:bold;">'+data.entryauthor+'</a></u>'+
								  ' <a href="/entry/'+data.entryid+'" style="color:black;font-size:11px;">'+enrtrydate+'</a></div></div>'+
								'</div>')
		})
	}
	else{
		$(".logRegDiv").html("")
		$(".logRegDiv").prepend('<a href="/profile" class="btn btnLogReg">Profile</a>')
		$(".logRegDiv").prepend('<a href="#" class="btn btnLogReg" id="exit">Exit</a>')
		$.post("/getEntryForUser",{entryid:entryid,token:token},function(res){
			var data=res.payload.res[0]
			var entries=$(".entries")
			entries.html("")
			entries.prepend('<a href="/topic/'+data.topicid+'" style="font-size:20px;color:black;text-decoration: underline;margin-left:10px">'+data.topicname+'</a>')
			var enrtrydate=data.entrycreatedat
			enrtrydate=enrtrydate.replace("T"," ").replace(".000Z","")
			if(data.entryupdatedat!=null){
				enrtrydate+=" - "+data.entryupdatedat
				enrtrydate=enrtrydate.replace("T"," ").replace(".000Z","")
			}
			var isFav="glyphicon glyphicon-star-empty"
			if(data.isFav==1){
				isFav="glyphicon glyphicon-star"
			}
			if(userid==data.userid){
				entries.append('<div class="panel panel-primary">'+
								  '<div class="panel-body" style="overflow-wrap: break-word;">'+data.entrycontent+'</div>'+
								  '<div class="panel-footer" style="white-space: nowrap;overflow: hidden;"><span style="cursor:pointer" class="favBtn '+isFav+'" aria-hidden="true"></span>'+
								  'Fav:<u class="favCountBtn" style="cursor:pointer" entryid="'+data.entryid+'">'+data.entryfavcount+
								  '</u><div style="float:right;" class="panel-footer-right"><u><a href="/user/'+data.entryauthor+'" style="color:black;font-weight:bold;">'+data.entryauthor+'</a></u>'+
								  ' <a href="/entry/'+data.entryid+'" style="color:black;font-size:11px;">'+enrtrydate+'</a>'+
								  ' <span style="cursor:pointer" class="glyphicon glyphicon-edit entryEdit" aria-hidden="true"></span>'+
								  ' <span style="cursor:pointer" class="glyphicon glyphicon-remove entryRemove" aria-hidden="true"></div></div>'+
								'</div>')
			}
			else{
				entries.append('<div class="panel panel-primary">'+
								  '<div class="panel-body" style="overflow-wrap: break-word;">'+data.entrycontent+'</div>'+
								  '<div class="panel-footer" style="white-space: nowrap;overflow: hidden;"><span style="cursor:pointer" class="favBtn '+isFav+'" aria-hidden="true"></span>'+
								  'Fav:<u class="favCountBtn" style="cursor:pointer" entryid="'+data.entryid+'">'+data.entryfavcount+
								  '</u><div style="float:right;" class="panel-footer-right"><u><a href="/user/'+data.entryauthor+'" style="color:black;font-weight:bold;">'+data.entryauthor+'</a></u>'+
								  ' <a href="/entry/'+data.entryid+'" style="color:black;font-size:11px;">'+enrtrydate+'</a></div></div>'+
								'</div>')
			}
		})
		$(document).on('click','.favCountBtn', function(){
		$("#pageModal").html("")
		$("#pageModal").append('<div class="modal fade" id="favModal" role="dialog">'+
			    '<div class="modal-dialog">'+
			      '<div class="modal-content">'+
			        '<div class="modal-header">'+
			          '<button type="button" class="close" data-dismiss="modal">&times;</button>'+
			          '<h4 class="modal-title">Users which was added fav:</h4>'+
			        '</div>'+
			        '<center><div class="modal-body" id="favusersdiv" style="font-weight:bold">'+
			        '</div></center>'+
			        '<div class="modal-footer">'+
			          '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>'+
			        '</div>'+
			      '</div>'+
			    '</div>'+
			  '</div>')
		var entryid=$(this).attr("entryid")
		$.post("/listEntryFavUser",{entryid:entryid},function(res){
			var data=res.payload.res
			for(var i=0;i<data.length;i++){
				$("#favusersdiv").append('<a href="/user/'+data[i].username+'">'+data[i].username+'</a><br>')
			}
			if($("#favusersdiv").html()==""){
				$("#favusersdiv").html("There is no user which was added fav this entry.")
			}
			})
		    $("#favModal").modal("show")
		})
		$(document).on('click','.favBtn', function(){
			var entryid=$(this).parent().children('u.favCountBtn').attr('entryid')
			var favCount=$(this).parent().children('u.favCountBtn')
			var favStatus=$(this)
			var isFav=0
			if(favStatus.attr('class')=="favBtn glyphicon glyphicon-star"){
				isFav=1
			}
			if(isFav==0){
				$.post("/favEntry",{entryid:entryid,token:token},function(res){
					favStatus.removeClass("glyphicon-star-empty").addClass("glyphicon-star")
					var newNumber=parseInt(favCount.text(),10)+1
					favCount.text(newNumber)
				})
			}
			if(isFav==1){
				$.post("/unfavEntry",{entryid:entryid,token:token},function(res){
					favStatus.removeClass("glyphicon-star").addClass("glyphicon-star-empty")
					var newNumber=parseInt(favCount.text(),10)-1
					favCount.text(newNumber)
				})
			}
		})
	}
})