require 'rails_helper'

RSpec.describe Review, :type => :model do

	context 'With a Restaurant in the DB' do

		it 'creates a valid review attached to a restaurant' do
			restaurant = Restaurant.new(name: 'Burger King', cuisine: 'Fast food')
			restaurant.reviews.new(rating: 3)

			expect(restaurant.reviews.first).to be_valid
		end

	  it 'is not valid if rating is greater 5' do
	  	review = Review.new(rating: 10)
	  	expect(review).to have(1).error_on(:rating)
	  end

	  it 'is not valid if rating is less than 1' do
	  	review = Review.new(rating: -1)
	  	expect(review).to have(1).error_on(:rating)
	  end

	end

end
