$(document).ready(function() {
	$('.restaurant .show_reviews_btn').click(function(event) {
		event.preventDefault();
		$(this).text('Hide reviews');
		$(this).siblings('.restaurant_reviews').slideDown();
	})
})