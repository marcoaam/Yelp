require 'rails_helper'

describe 'Reviews a Restaurant' do

	before(:each) do
		Restaurant.create(name: 'Buger King', cuisine: 'Fast food')
	end

	it 'Creates a review filling a form with the thought and rating' do
		create_review('Great place!!!', '3')
		expect(page).to have_content 'Great place!!! (3)'
	end

	it 'Shows the average rating of the restaurants reviews' do
		create_review('Not bad', '3')
		create_review('Great place!!!', '5')
		expect(page).to have_content 'Average rating: (4.0)'
	end

end