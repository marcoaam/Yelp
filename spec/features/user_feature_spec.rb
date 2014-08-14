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
end