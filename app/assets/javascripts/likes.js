$(document).ready(function() {
	$('.like').on('click', function(event) {
		var likeCount = $(this).siblings('.likes_count')
		event.preventDefault();
		$.post(this.href, function(response) {
			likeCount.text('likes: ' + response.new_likes_count);
		})
	})
})