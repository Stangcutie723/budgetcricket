require 'spec_helper'

feature "Creating Expenses" do
  before do
    Factory(:budget, :name => "Internet Explorer")
    visit '/'
    click_link "Internet Explorer"
    click_link "New Expense"
  end

  scenario "Creating an Expense" do
    fill_in "Title", :with => "Non-standards compliance"
    fill_in "Cost", :with => "2.50"
    click_button "Create Expense"
    page.should have_content("Expense has been created.")
  end

  scenario "Creating a Expense without valid attributes fails" do
    click_button "Create Expense"
    page.should have_content("Expense has not been created.")
    page.should have_content("Title can't be blank")
  end
end
