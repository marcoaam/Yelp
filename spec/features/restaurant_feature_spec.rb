require 'rails_helper'

feature 'Without restaurants' do

	scenario 'Shows that no Restaurants have been added' do
		visit '/restaurants'
		expect(page).to have_content 'No restaurants have been added'
		expect(page).to have_link 'Add Restaurant'
	end

	scenario 'A new restaurant can not be added with a invalid format' do
		visit '/restaurants'
		click_link 'Add Restaurant'

		fill_in 'Name', with: 'kf'
		fill_in 'Cuisine', with: 'Fast food'
		click_button 'Create Restaurant'
		expect(page).not_to have_content 'kf'
		expect(page).not_to have_content 'Fast food'
	end

	scenario 'A new restaurant can be added' do
		visit '/restaurants'
		click_link 'Add Restaurant'

		fill_in 'Name', with: 'KFC'
		fill_in 'Cuisine', with: 'Fast food'
		click_button 'Create Restaurant'
		expect(page).to have_content 'KFC'
		expect(page).to have_content 'Fast food'
	end
	
end

feature 'With restaurants added' do

	before(:each) do
		Restaurant.create(name: 'Burger King', cuisine: 'Fast food')
	end

	scenario 'Shows all restaurants' do
		visit '/restaurants'
		expect(page).not_to have_content 'No restaurants have been added'
		expect(page).to have_content 'Burger King'
		expect(page).to have_content 'Fast food'
		expect(page).to have_link 'Add Restaurant'
	end

	scenario 'can edit a restaurant' do
		visit '/restaurants'
		click_link 'Edit'
		fill_in 'Name', with: 'KFC'
		fill_in 'Cuisine', with: 'Fast food'
		click_button 'Update Restaurant'
		expect(page).to have_content 'Restaurant updated successfully'
		expect(page).to have_content 'KFC'
		expect(page).to have_content 'Fast food'
	end

	scenario 'can delete a restaurant' do
		visit '/restaurants'
		click_link 'Delete'
		expect(page).to have_content 'Restaurant deleted successfully'
		expect(page).not_to have_content 'Burger King'
	end
	
end