require 'spec_helper'

feature "Editing expenses" do
  let!(:budget) { Factory(:budget) }
  let!(:expense) { Factory(:expense, :budget => budget) }
  before do
    visit '/budgets/1/expenses/1'
    click_link "Edit Expense"
  end

  scenario "Updating a expense" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update Expense"
    page.should have_content "Expense has been updated."
    page.should_not have_content expense.title
  end

  scenario "Updating a expense with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Expense"
    page.should have_content("Expense has not been updated.")
  end
end
