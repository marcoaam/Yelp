require 'rails_helper'

feature 'Review Likes' do

	before(:each) do
		Restaurant.create(name: 'Burger King', cuisine: 'Fast food')
	end

	scenario 'like a comment', js: true do
		create_review("Great Restaurant", '4', true)
		click_link 'Show Reviews'
		expect(find('.likes_count')).to have_content('likes: 0')
		click_link 'Like'
		expect(find('.likes_count')).to have_content('likes: 1')
	end

end