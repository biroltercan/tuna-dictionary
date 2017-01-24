$(function() {
	var username=$("#usernameSpan").text()
	var token=Cookies.get('token')
	var userid=Cookies.get('userid')
	if(token!=null){
		$(".logRegDiv").html("")
		$(".logRegDiv").prepend('<a href="/profile" class="btn btnLogReg">Profile</a>')
		$(".logRegDiv").prepend('<a href="#" class="btn btnLogReg" id="exit">Exit</a>')
	}
	$.post("/getUserId",{username:username},function(res){
		var userid=res.payload.userid
		if(userid==null){
			$("#profileHeader").html("There isn't a user which name is "+username)
		}
		else{
			$.post("/getUserEntries",{userid:userid},function(res){
				var data=res.payload.res[0]
				$("#profileHeader").after("<div style='font-size:13px;text-align:center;color:gray'><span title='Sum Entry Number'>"
					+data.sum+"</span> . <span title='Sum Entry Number of Last 30 Days'>"+data.last30days+
					"</span> . <span title='Sum Entry Number of Last 7 Days'>"+data.last7days+
					"</span> . <span title='Sum Entry Number of Last 24 Hours'>"+data.last24hours+"</span></div>")
				var entrieshtml="<ul class='nav'>"
				var data1=res.payload.res1
				var favhtml="<ul class='nav'>"
				var data2=res.payload.res2
				var userfavhtml="<ul class='nav'>"
				var data3=res.payload.res3
				for(var i=0;i<10;i++){
					if(!data1[i]){
						continue
					}
					entrieshtml+="<li><a href='/entry/"+data1[i].entryid+"'>"+data1[i].topicname+"</a></li>"
				}
				entrieshtml+="</ul><center><button class='btn btn-info' id='showAllLastBtn'>Show All</button></center>"
				$("#lastEntries").append(entrieshtml)
				for(var i=0;i<10;i++){
					if(!data2[i]){
						continue
					}
					favhtml+="<li><a href='/entry/"+data2[i].entryid+"'>"+data2[i].topicname+"</a></li>"
				}
				favhtml+="</ul><center><button class='btn btn-info' id='showAllFavBtn'>Show All</button></center>"
				$("#mostFavEntries").append(favhtml)
				for(var i=0;i<10;i++){
					if(!data3[i]){
						continue
					}
					userfavhtml+="<li><a href='/entry/"+data3[i].entryid+"'>"+data3[i].topicname+"</a></li>"
				}
				userfavhtml+="</ul><center><button class='btn btn-info' id='showAllUserFavBtn'>Show All</button></center>"
				$("#hisFavEntries").append(userfavhtml)

				$(document).on('click','#showAllLastBtn', function(){
					$("#lastEntries").html("")
					var entrieshtml="<ul class='nav'>"
					for(var i=0;i<data1.length;i++){
						entrieshtml+="<li><a href='/entry/"+data1[i].entryid+"'>"+data1[i].topicname+"</a></li>"
					}
					entrieshtml+="</ul>"
					$("#lastEntries").append(entrieshtml)
				})
				$(document).on('click','#showAllFavBtn', function(){
					$("#mostFavEntries").html("")
					var favhtml="<ul class='nav'>"
					for(var i=0;i<data2.length;i++){
						favhtml+="<li><a href='/entry/"+data2[i].entryid+"'>"+data2[i].topicname+"</a></li>"
					}
					favhtml+="</ul>"
					$("#mostFavEntries").append(favhtml)
				})
				$(document).on('click','#showAllUserFavBtn', function(){
					$("#hisFavEntries").html("")
					var userfavhtml="<ul class='nav'>"
					for(var i=0;i<data3.length;i++){
						userfavhtml+="<li><a href='/entry/"+data3[i].entryid+"'>"+data3[i].topicname+"</a></li>"
					}
					userfavhtml+="</ul>"
					$("#hisFavEntries").append(userfavhtml)
				})
			})
		}
	})
})