require 'spec_helper'

feature "Viewing budgets" do
  scenario "Listing all budgets" do
    budget = Factory.create(:budget, :name => "TextMate 2")
    visit '/'
    click_link 'TextMate 2'
    page.current_url.should == budget_url(budget)
  end
end
