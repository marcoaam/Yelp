require 'rails_helper'

describe 'Reviews a Restaurant' do

	before(:each) do
		Restaurant.create(name: 'Buger King', cuisine: 'Fast food')
	end

	it 'Creates a review filling a form with the thought and rating' do
		visit restaurants_path
		click_link 'Review'
		fill_in 'Thoughts', with: 'Great place!!!'
		select '3', from: 'Rating'
		click_button 'Create Review'
		expect(current_path).to eq restaurants_path
		expect(page).to have_content 'Great place!!! (3)'
	end

end