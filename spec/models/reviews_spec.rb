require 'rails_helper'

RSpec.describe Review, :type => :model do

	let(:restaurant) { Restaurant.create(name: 'Burger King', cuisine: 'Fast food') }

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

	  it 'shows N/A if the restaurant does not have reviews' do
	  	expect(restaurant.average_rating).to eq 'N/A'
	  end

	  it 'shows the rating if the restaurant have one rating' do
	  	restaurant.reviews.create(thoughts: 'Great', rating: 5)
	  	expect(restaurant.average_rating).to eq 5
	  end

	  it 'returns the average of the ratings for whole numbers' do
	  	restaurant.reviews.create(thoughts: 'Great', rating: 5)
	  	restaurant.reviews.create(thoughts: 'Ok', rating: 3)
	  	expect(restaurant.average_rating).to eq 4
	  end

	  it 'returns the average of the ratings as float' do
	  	restaurant.reviews.create(thoughts: 'Great', rating: 5)
	  	restaurant.reviews.create(thoughts: 'Ok', rating: 2)
	  	expect(restaurant.average_rating).to eq 3.5
	  end

	end

end
