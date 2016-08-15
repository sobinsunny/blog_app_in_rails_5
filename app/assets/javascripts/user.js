$(document).ready(function(){
	var typingTimer;
	var doneTypingInterval = 2000;
	$('#query').on('keyup', function () {
			clearTimeout(typingTimer);
			typingTimer = setTimeout(doneTyping,doneTypingInterval);
	});
	$("#query").on('keydown', function () {
		console.log('reset timing')
		clearTimeout(typingTimer);
	});
	function get_query_string(){
		return  $("#query").val()
	}
	function doneTyping() {
		var url = "/posts/search"
		var query_string = get_query_string()
		$.ajax({
			url: url,
			data: {
				query: query_string
			},
			success: function(result){
				render_posts_result(result);
			}
		});
	}
	function render_posts_result(result){
		$("#post_list_div").html(result);
	}
});
