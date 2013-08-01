require 'spec_helper'

feature "Deleting budgets" do
  scenario "Deleting a budget" do
    budget = Factory(:budget, :name => "TextMate 2")
    visit budget_path(budget)
    click_link "Delete Budget"
    page.should have_content("Budget has been deleted.")

    visit "/"
    page.should_not have_content("TextMate 2")
  end
end
