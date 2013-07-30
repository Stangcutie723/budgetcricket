require 'spec_helper'

feature "Editing expenses" do
  let!(:budget) { Factory(:budget) }
  let!(:expense) { Factory(:expense, :budget => budget) }
  before do
    visit '/'
    click_link budget.name
    click_link expense.title
    click_link "Edit expense"
  end

  scenario "Updating a expense" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update expense"
    page.should have_content "Expense has been updated."
    within("#expense h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content expense.title
  end

  scenario "Updating a expense with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update expense"
    page.should have_content("Expense has not been updated.")
  end
end
