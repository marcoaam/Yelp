require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	it "doesn't have any Restaurant if it hasn't been added" do
		expect(Restaurant.all.count).to eq 0
	end

  it 'can add a Restaurant providing the name' do
		Restaurant.create(:name => 'Burger King')
		expect(Restaurant.all.count).to eq 1
  	expect(Restaurant.first.name).to eq 'Burger King'
  end

  it 'can add a Restaurant providing the name and cuisine' do
		Restaurant.create(:name => 'Taco bell', :cuisine => 'Mexican')
		expect(Restaurant.all.count).to eq 1
  	expect(Restaurant.first.name).to eq 'Taco Bell'
  end

end
