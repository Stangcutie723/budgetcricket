require 'spec_helper'

feature "Viewing budgets" do
  scenario "Listing all budgets" do
    budget = Factory.create(:budget, :name => "TextMate 2")
    visit budget_path(budget)
    page.current_url.should == budget_url(budget)
  end
end
