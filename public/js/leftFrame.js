$(function() {
	function dailyLeftFrame(){
		$.post("/dailyLeftFrame",function(res){
			var topicsUL=$(".topicsUL")
			topicsUL.html("")
			var data=res.payload.res
			for(var i=0;i<data.length;i++){
				topicsUL.append('<li><a href="/topic/'+data[i].topicid+'">'+data[i].topicname+'('+data[i].entrycountfortopic+')'+'</a></li>')
			}
			if(topicsUL.html()==""){
				topicsUL.append("<li style='color:white'>There are no topics now.</li>")
			}
		})
	}
	function popularLeftFrame(){
		$.post("/popularLeftFrame",function(res){
			var topicsUL=$(".topicsUL")
			topicsUL.html("")
			var data=res.payload.res
			for(var i=0;i<data.length;i++){
				topicsUL.append('<li><a href="/topic/'+data[i].topicid+'">'+data[i].topicname+'('+data[i].entrycountfortopic+')'+'</a></li>')
			}
			if(topicsUL.html()==""){
				topicsUL.append("<li style='color:white'>There are no popular topics now.</li>")
			}
		})
	}
	dailyLeftFrame()
	$("#todayTopics").click(function(){
		dailyLeftFrame()
	})
	$("#popularTopics").click(function(){
		popularLeftFrame()
	})
})