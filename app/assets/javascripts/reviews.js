$(document).ready(function() {

	$('.show_reviews_btn').click(function(event) {

		event.preventDefault();
		if($(this).text() === 'Show Reviews') {
			$(this).text('Hide reviews');
		} else {
			$(this).text('Show Reviews');
		}
		$(this).siblings('.restaurant_reviews').slideToggle();

	})

})