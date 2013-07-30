require 'spec_helper'

feature "Creating Expenses" do
  before do
    Factory(:budget, :name => "Internet Explorer")
    visit '/'
    click_link "Internet Explorer"
    click_link "New Expense"
  end

  scenario "Creating a Expense" do
    fill_in "Title", :with => "Non-standards compliance"
    fill_in "Description", :with => "My pages are ugly!"
    click_button "Create Expense"
    page.should have_content("Expense has been created.")
  end

  scenario "Creating a Expense without valid attributes fails" do
    click_button "Create Expense"
    page.should have_content("Expense has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end

  scenario "Description must be longer than 10 characters" do
    fill_in "Title", :with => "Non-standards compliance"
    fill_in "Description", :with => "it sucks"
    click_button "Create Expense"
    page.should have_content("Expense has not been created.")
    page.should have_content("Description is too short")
  end
end
