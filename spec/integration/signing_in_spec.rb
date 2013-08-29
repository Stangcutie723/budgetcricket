require 'spec_helper'

feature 'Signing in' do
  before do
    Factory(:user, :email => "budgetcricket@example.com")
    visit '/users/sign_in'
  end

  scenario 'Signing in via form' do
    fill_in 'Email', :with => "budgetcricket@example.com"
    fill_in 'Password', :with => "password"
    click_button "Login"
    page.should have_content("Signed in successfully.")
  end
end
