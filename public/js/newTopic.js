$(function(){
	var token=Cookies.get('token')
	var topicname=$("#topicName").text()
	$.post("/getTopic",{word:topicname},function(res){
				if(res.payload.res[0]){
					var topicid=res.payload.res[0].id
					window.location.href="/topic/"+topicid
				}
			})
	if(token==null){
		$(".panel-group").html("")
		$(".panel-group").append("<div style='font-size:20px;margin-top:10px;text-align:center'>There isn't a topic which it's name is <b>"+topicname+"</b></div>")
	}
	else{
		$(".logRegDiv").html("")
		$(".logRegDiv").prepend('<a href="/profile" class="btn btnLogReg">Profile</a>')
		$(".logRegDiv").prepend('<a href="#" class="btn btnLogReg" id="exit">Exit</a>')
		
		$("#btnSendEntry").click(function(){
			var content=$("#newEntryInput").val()
			if(content.length>3000){
		    	alert("Max entry length is 3000 characters.")
		    	return
		    }
		    if(content.length<5){
		    	alert("Entry length must be longer than 5 characters.")
		    	return
		    }
		    $.post("/newTopic",{name:topicname,content:content,token:token},function(res){
		    	if(res.code==404){
		    		alert(res.message)
		    		return
		    	}
		    	else{
		    		alert(res.message)
		    		window.location.href="/topic/"+res.payload.topicid
		    	}
		    })
		})	
	}
	
})