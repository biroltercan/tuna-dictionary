$(function() {
	var token=Cookies.get('token')
	if(token!=null){
		location.href="/"
	}
	else{
		$("#loginBtn").click(function(){
			var username=$("#username").val()
			var password=$("#password").val()
			if(username==""||password==""){
				alert("Username or password can not be null.")
				return
			}
			$.post("/login",{username:username,password:password},function(res){
				if(res.code==404){
					alert(res.message)
					return
				}
				else{
					alert(res.message)
					Cookies.set('token', res.payload.token)
					Cookies.set('userid', res.payload.userid)
					Cookies.set('username', res.payload.username)
					location.href="/"
				}
			})
		})
	}
})