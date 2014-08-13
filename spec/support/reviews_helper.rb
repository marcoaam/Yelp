def create_review(thoughts, rating)
	visit restaurants_path
	fill_in 'Thoughts', with: thoughts
	select rating, from: 'Rating'
	click_button 'Create Review'
	expect(current_path).to eq restaurants_path
end