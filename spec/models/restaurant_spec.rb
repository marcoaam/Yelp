require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	context 'Before adding one' do
	
		it "doesn't have any Restaurant if it hasn't been added" do
			expect(Restaurant.all.any?).to eq false
		end

	  it 'can add a Restaurant providing the name' do
			Restaurant.create(:name => 'Burger King')
			expect(Restaurant.all.count).to eq 1
	  	expect(Restaurant.first.name).to eq 'Burger King'
	  end

	  it 'can add a Restaurant providing the name and cuisine' do
			Restaurant.create(:name => 'Taco Bell', :cuisine => 'Mexican')
			expect(Restaurant.all.count).to eq 1
	  	expect(Restaurant.first.name).to eq 'Taco Bell'
	  end

	  it 'can not add a Restaurant with a name less than 3 letters' do
	  	restaurant = Restaurant.new(:name => 'bu', :cuisine => 'Fast food')
	  	expect(restaurant).to have(1).error_on(:name)
	  end

	  it 'can not add a Restaurant with a name bigger than 50 characters' do
	  	name = 'a' * 51
	  	restaurant = Restaurant.new(:name => name, :cuisine => 'Fast food')
	  	expect(restaurant).to have(1).error_on(:name)
	  end

	  it 'gets a error if the same restaurant was already added' do
	  	Restaurant.create(:name => 'Burger King')
	  	restaurant = Restaurant.create(:name => 'Burger King')
	  	expect(restaurant).to have(1).error_on(:name)
	  end

	end

end
