$(function(){
	var token=Cookies.get('token')
	var userid=Cookies.get('userid')
	var username=Cookies.get('username')
	if(token==null){
		window.location.href="/"
	}
	else{
		$("#usernameSpan").text(username)
		$(".logRegDiv").html("")
		$(".logRegDiv").prepend('<a href="/profile" class="btn btnLogReg">Profile</a>')
		$(".logRegDiv").prepend('<a href="#" class="btn btnLogReg" id="exit">Exit</a>')
	}
})