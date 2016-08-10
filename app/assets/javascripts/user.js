$(document).ready(function(){
	var typingTimer;
	var doneTypingInterval = 5000;
	$('#query').on('keyup', function () {
		var url = "/posts/search"
		clearTimeout(typingTimer);
		typingTimer = setTimeout(doneTyping(url), doneTypingInterval);
	});
	$("#query").on('keydown', function () {
		clearTimeout(typingTimer);
	});
	function get_query_string(){
		return  $("#query").val()
	}


	function doneTyping (url) {
		var query_string = get_query_string()
		$.ajax({
			url: url,
			data: {
				query: query_string
			},
			success: function(result){
				$("#post_list_div").html(result);
			}
		});
	}
});
