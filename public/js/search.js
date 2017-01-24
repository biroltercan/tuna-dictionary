$(function() {
	$("#searchbox").keyup(function(e){
		var word=$("#searchbox").val()
		var keyCode = e.keyCode || e.which;
		if(keyCode == 13) {
			if(word.length<1){
				alert("Topic name can not be null.")
				return
			}
			$.post("/getTopic",{word:word},function(res){
				if(res.payload.res[0]){
					var topicid=res.payload.res[0].id
					window.location.href="/topic/"+topicid
				}
				else{
					window.location.href="/newTopic/"+word
				}
			})
		}
		if(word.length>1){
			$.post("/search",{word:word},function(res){
				var availableTags=[]
				for(var i=0;i<5;i++){
					if(res.payload.res[i]==null){
						break
					}
					else{
						availableTags.push(res.payload.res[i].name)
					}
				}
				var topicid=null
				$(".autocomplete").autocomplete({
				    source: availableTags,
				    select: function(event, ui) { 
					    for(var i=0;i<5;i++){
					    	if(res.payload.res[i]==null){
								break
							}
							else{
								if(res.payload.res[i].name==ui.item.value){
						    		topicid=res.payload.res[i].id
						    		window.location.href="/topic/"+topicid
						    	}
							}
					    }
					}
				})
			})
		}
	})
})