def create_review(thoughts, rating, javascript_enabled = false)
	visit restaurants_path
	click_link 'Show Reviews' if javascript_enabled
	fill_in 'Thoughts', with: thoughts
	select rating, from: 'Rating'
	click_button 'Create Review'
end