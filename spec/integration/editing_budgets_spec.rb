require 'spec_helper'

feature "Editing Budgets" do
  before do
    budget = Factory(:budget, :name => "TextMate 2")
    visit budget_path(budget)
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
