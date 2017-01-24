$(function() {
	var token=Cookies.get('token')
	var userid=Cookies.get('userid')
	var topicid=$("#topicInfo").attr("topicid")
	var page=$("#topicInfo").attr("page")
	if(token!=null){
		$(".logRegDiv").html("")
		$(".logRegDiv").prepend('<a href="/profile" class="btn btnLogReg">Profile</a>')
		$(".logRegDiv").prepend('<a href="#" class="btn btnLogReg" id="exit">Exit</a>')
		listEntryForTopicUser()
	}
	else{
		listEntryForTopicGuest()
	}
	function listEntryForTopicGuest(){
		$.post("/listEntryForTopicGuest",{topicid:topicid,page:page},function(res){
			var data=res.payload.res
			var entries=$(".entries")
			entries.html("")
			entries.prepend('<a href="/topic/'+topicid+'" style="font-size:20px;color:black;text-decoration: underline;margin-left:10px">'+data[0].topicname+'</a><span style="float:right;margin-top:5px"><select id="pagecombobox" style="width:35px"></select></span>')
			totalEntryCountForTopic()
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
									  '<div class="panel-body" style="overflow-wrap: break-word;">'+data[i].entrycontent+'</div>'+
									  '<div class="panel-footer" style="white-space: nowrap;overflow: hidden;">Fav:<u class="favCountBtn" style="cursor:pointer" entryid="'+data[i].entryid+'">'+data[i].entryfavcount+
									  '</u><div style="float:right;"><u><a href="/user/'+data[i].entryauthor+'" style="color:black;font-weight:bold;">'+data[i].entryauthor+'</a></u>'+
									  ' <a href="/entry/'+data[i].entryid+'" style="color:black;font-size:11px;">'+enrtrydate+'</a></div></div>'+
									'</div>')
			}

		})
	}
	function listEntryForTopicUser(){
		$.post("/listEntryForTopicUser",{topicid:topicid,page:page,token:token},function(res){
			var data=res.payload.res
					var entries=$(".entries")
					entries.html("")
					entries.prepend('<a href="/topic/'+topicid+'" style="font-size:20px;color:black;text-decoration: underline;margin-left:10px">'+data[0].topicname+'</a><span style="float:right;margin-top:5px"><select id="pagecombobox" style="width:35px"></select></span>')
					totalEntryCountForTopic()
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
						var isFav="glyphicon glyphicon-star-empty"
						if(data[i].isFav==1){
							isFav="glyphicon glyphicon-star"
						}
						if(userid==data[i].userid){
							entries.append('<div class="panel panel-primary">'+
											  '<div class="panel-body" style="overflow-wrap: break-word;">'+data[i].entrycontent+'</div>'+
											  '<div class="panel-footer" style="white-space: nowrap;overflow: hidden;"><span style="cursor:pointer" class="favBtn '+isFav+'" aria-hidden="true"></span>'+
											  'Fav:<u class="favCountBtn" style="cursor:pointer" entryid="'+data[i].entryid+'">'+data[i].entryfavcount+
											  '</u><div style="float:right;" class="panel-footer-right"><u><a href="/user/'+data[i].entryauthor+'" style="color:black;font-weight:bold;">'+data[i].entryauthor+'</a></u>'+
											  ' <a href="/entry/'+data[i].entryid+'" style="color:black;font-size:11px;">'+enrtrydate+'</a>'+
											  ' <span style="cursor:pointer" class="glyphicon glyphicon-edit entryEdit" aria-hidden="true"></span>'+
											  ' <span style="cursor:pointer" class="glyphicon glyphicon-remove entryRemove" aria-hidden="true"></div></div>'+
											'</div>')
						}
						else{
							entries.append('<div class="panel panel-primary">'+
											  '<div class="panel-body" style="overflow-wrap: break-word;">'+data[i].entrycontent+'</div>'+
											  '<div class="panel-footer" style="white-space: nowrap;overflow: hidden;"><span style="cursor:pointer" class="favBtn '+isFav+'" aria-hidden="true"></span>'+
											  'Fav:<u class="favCountBtn" style="cursor:pointer" entryid="'+data[i].entryid+'">'+data[i].entryfavcount+
											  '</u><div style="float:right;" class="panel-footer-right"><u><a href="/user/'+data[i].entryauthor+'" style="color:black;font-weight:bold;">'+data[i].entryauthor+'</a></u>'+
											  ' <a href="/entry/'+data[i].entryid+'" style="color:black;font-size:11px;">'+enrtrydate+'</a></div></div>'+
											'</div>')
						}
					}
					entries.append('<textarea class="form-control" rows="5" style="resize: none;margin-top:5px" id="newEntryInput" placeholder="You can write your entry here..."></textarea>'+
						'<button class="btn btn-success" id="btnSendEntry" style="float:right;margin-top:5px">Send</button>')

		})
	}
	function totalEntryCountForTopic(){
		$.post("/totalEntryCountForTopic",{topicid:topicid},function(res){
			var pagecombobox=$("#pagecombobox")
			var pagecount=Math.ceil(res.payload.res[0].COUNT/10)
			for(var i=0;i<pagecount;i++){
				var index=i+1
				pagecombobox.append("<option>"+index+"</option>")
				$("#pagecombobox").val(page)
			}			
		})
	}
	$(document).on('change','#pagecombobox', function(){
	    var newpage=$(this).val()
	    window.location.href="/topic/"+topicid+"/"+newpage
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
	$(document).on('click','#btnSendEntry', function(){
	    var content=$("#newEntryInput").val()
	    if(content.length>3000){
	    	alert("Max entry length is 3000 characters.")
	    	return
	    }
	    if(content.length<5){
	    	alert("Entry length must be longer than 5 characters.")
	    	return
	    }
	    $.post("/newEntry",{topicid:topicid,content:content,token:token},function(res){
	    	if(res.code==404){
	    		alert(res.message)
	    		return
	    	}
	    	else{
	    		alert(res.message)
	    		$.post("/totalEntryCountForTopic",{topicid:topicid},function(res){
	    			var pagecount=Math.ceil(res.payload.res[0].COUNT/10)
	    			window.location.href="/topic/"+topicid+"/"+pagecount
	    		})
	    	}
	    })
	})
	$(document).on('click','.entryEdit', function(){
		var entryid=$(this).parent().parent().children('u').attr('entryid')
		var oldEntryText=$(this).parent().parent().parent().children('.panel-body').text()
		$("#pageModal").html("")
		$("#pageModal").append('<div class="modal fade" id="editModal" role="dialog">'+
			    '<div class="modal-dialog">'+
			      '<div class="modal-content">'+
			        '<div class="modal-header">'+
			          '<button type="button" class="close" data-dismiss="modal">&times;</button>'+
			          '<h4 class="modal-title">You can edit your entry here:</h4>'+
			        '</div>'+
			        '<center><div class="modal-body" id="editEntryDiv" style="font-weight:bold">'+
			        '<textarea class="form-control" rows="5" style="resize: none;" id="editEntryInput">'+oldEntryText+'</textarea>'+
			        '</div></center>'+
			        '<div class="modal-footer">'+
			          '<button class="btn btn-success" id="btnSendEditedEntry" entryid="'+entryid+'" style="float:right">Send</button>'+
			        '</div>'+
			      '</div>'+
			    '</div>'+
			  '</div>')
		$("#editModal").modal("show")
	})
	$(document).on('click','#btnSendEditedEntry', function(){
	    var content=$("#editEntryInput").val()
	    var entryid=$(this).attr('entryid')
	    if(content.length>3000){
	    	alert("Max entry length is 3000 characters.")
	    	return
	    }
	    if(content.length<5){
	    	alert("Entry length must be longer than 5 characters.")
	    	return
	    }
	    $.post("/editEntry",{entryid:entryid,content:content,token:token},function(res){
	    	if(res.code==404){
	    		alert(res.message)
	    		return
	    	}
	    	else{
	    		$("#editModal").modal("hide")
	    		alert(res.message)
	    		location.reload()
	    	}
	    })
	})
})