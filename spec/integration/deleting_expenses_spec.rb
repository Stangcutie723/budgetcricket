require 'spec_helper'

feature 'Deleting expenses' do
  let!(:budget) { Factory(:budget) }
  let!(:expense) { Factory(:expense, :budget => budget) }

  before do
    visit '/budgets/1/expenses/1'
  end

  scenario "Deleting a expense" do
    click_link "Delete Expense"
    page.should have_content("Expense has been deleted.")
    page.current_url.should == budget_url(budget)
  end
end
