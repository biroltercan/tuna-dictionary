$(function() {
	var token=Cookies.get('token')
	if(token!=null){
		location.href="/"
	}
	else{
		$("#registerBtn").click(function(){
			var username=$("#username").val()
			var password=$("#password").val()
			var passwordAgain=$("#passwordAgain").val()
			var mail=$("#mail").val()
			if(username==""||password==""||passwordAgain==""||mail==""){
				alert("Informations can not be null.")
				return
			}
			if(password!=passwordAgain){
				alert("Passwords are not same.")
				return
			}
			if(mail.indexOf("@")>-1){
				$.post("/register",{username:username,password:password,mail:mail},function(res){
					if(res.code==404){
						alert(res.message)
						return
					}
					else{
						alert(res.message)
						location.href="/login"
					}
				})
			}
			else{
				alert("Invalid e-mail.")
				return
			}
		})
	}
})