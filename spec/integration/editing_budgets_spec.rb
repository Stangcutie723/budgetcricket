require 'spec_helper'

feature "Editing Budgets" do
  before do
    Factory(:budget, :name => "TextMate 2")
    visit "/"
    click_link "TextMate 2"
    click_link "Edit Budget"
  end

  scenario "Updating a budget" do
    fill_in "Name", :with => "TextMate 2 beta"
    click_button "Update Budget"
    page.should have_content("Budget has been updated.")
  end

  scenario "Updating a budget with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Budget"
    page.should have_content("Budget has not been updated.")
  end

end
