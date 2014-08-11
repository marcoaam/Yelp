require 'rails_helper'

feature 'Without restaurants' do
	scenario 'No Restaurants have been added' do
		visit '/restaurants'
		expect(page).to have_content 'No restaurants have been added'
		expect(page).to have_link 'Add Restaurant'
	end
	
end

feature 'Restaurant with a name' do

	before(:each) do
		Restaurant.create(name: 'Burger King')
	end

	scenario 'Restaurants have been added' do
		visit '/restaurants'
		expect(page).not_to have_content 'No restaurants have been added'
		expect(page).to have_content 'Burger King'
		expect(page).to have_link 'Add Restaurant'
	end
	
end

feature 'Restaurant with a name and cuisine' do

	before(:each) do
		Restaurant.create(name: 'Burger King', cuisine: 'Fast food')
	end

	scenario 'Restaurants have been added' do
		visit '/restaurants'
		expect(page).not_to have_content 'No restaurants have been added'
		expect(page).to have_content 'Burger King Fast food'
		expect(page).to have_link 'Add Restaurant'
	end
	
end