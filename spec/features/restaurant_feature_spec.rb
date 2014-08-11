require 'rails_helper'

feature 'Restaurant' do
	scenario 'No Restaurants have been added' do
		visit '/restaurants'
		expect(page).to have_content 'No restaurants have been added'
		expect(page).to have_link 'Add Restaurant'
	end
end