require 'rails_helper'

feature 'Review Likes' do

	before(:each) do
		restaurant = Restaurant.create(name: 'Burger King', cuisine: 'Fast food')
		restaurant.reviews.create(thoughts: 'good restaurant', rating: '4')
	end

	scenario 'like a comment' do
		visit restaurants_path
		click_link 'Like'
		expect(page).to have_content 'total: 1'
	end

end