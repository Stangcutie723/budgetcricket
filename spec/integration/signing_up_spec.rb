require 'spec_helper'

feature 'Signing up' do
  scenario 'Successful sign up' do
    visit '/users/sign_in'
    click_link 'Sign up'
    fill_in "Email", :with => "user@budgetcricket.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
  end
end
