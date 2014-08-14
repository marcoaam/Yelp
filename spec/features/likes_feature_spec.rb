require 'rails_helper'

feature 'Review Likes' do

	before(:each) do
		restaurant = Restaurant.create(name: 'Burger King', cuisine: 'Fast food')
	end

	scenario 'like a comment', js: true do
		create_review("Great Restaurant", '4', true)
		click_link 'Show Reviews'
		click_link 'Like'
		expect(page).to have_content 'likes:  1'
	end

end