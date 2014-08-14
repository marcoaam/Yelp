require 'rails_helper'

feature 'Users' do

	scenario 'User can log in' do
		visit ('/users/sign_in')
		expect(page).to have_content('Sign in')
	end

	scenario 'User can sign up' do
		visit ('/users/sign_up')
		fill_in ('user[email]'), with: 'm@m.com'
		fill_in ('user[password]'), with: '12345678'
		fill_in ('user[password_confirmation]'), with: '12345678'
		click_button 'Sign up'
		expect(User.first.email).to eq 'm@m.com'
	end

	scenario 'can sign out' do
		marco = User.create(email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
		login_as marco
		visit '/restaurants'
		click_link 'Sign out'
		expect(page).to have_content 'Signed out successfully'
	end

end