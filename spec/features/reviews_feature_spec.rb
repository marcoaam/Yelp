require 'rails_helper'

describe 'Reviews a Restaurant' do

		context 'js disabled' do
		before(:each) do
			Restaurant.create(name: 'Burger King', cuisine: 'Fast food')
			create_review('Great place!!!', '3')
		end

		it 'Creates a review filling a form with the thought and rating' do
			expect(page).to have_content 'Great place!!! (★★★☆☆)'
		end

		it 'Shows the average rating of the restaurants reviews' do
			create_review('Great place!!!', '5')
			expect(page).to have_content 'Average rating: (★★★★☆)'
		end
	end

	context 'js enabled' do
		it 'Shows all reviews after click a button', js: true do
			Restaurant.create(name: 'Burger King', cuisine: 'Fast food')
			create_review('Great place!!!', '3', true)
			expect(page).not_to have_content('Great place!!!')
			click_link ('Show Reviews')
			expect(page).to have_content('Great place!!!')
		end
	end

end