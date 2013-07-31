require 'spec_helper'

feature "Creating Answers" do
  before do
    Factory(:question, :question => "Internet Explorer")
    user = Factory(:user, :email => "budgetcricket@example.com")
    user.confirm!

    visit '/'
    click_link "Internet Explorer"
    click_link "New Answer"
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", :with => "budgetcricket@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    within("h2") { page.should have_content("New Answer") }
  end

  scenario "Creating an answer" do
    fill_in "Answer", :with => "Non-standards compliance"
    click_button "Create Answer"
    page.should have_content("Answer has been created.")
    within("#answer #author") do
  page.should have_content("Created by budgetcricket@example.com")
end
  end

  scenario "Creating an answer without valid attributes fails" do
    click_button "Create Answer"
    page.should have_content("Answer has not been created.")
    page.should have_content("Answer can't be blank")
  end

  scenario "Answer must be longer than 1 character" do
    fill_in "Answer", :with => "Answer has not been created."
    click_button "Create Answer"
    page.should have_content("Answer has not been created.")
  end
end
