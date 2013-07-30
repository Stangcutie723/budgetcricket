require 'spec_helper'

feature 'Creating Budgets' do
  before do
    visit '/'
    click_link 'New Budget'
  end

  scenario "can create a budget" do
    fill_in 'Name', :with => 'TextMate 2'
    fill_in 'Description', :with => "A text-editor for OS X"
    click_button 'Create Budget'
    page.should have_content('Budget has been created.')

    budget = Budget.find_by_name("TextMate 2")
    page.current_url.should == budget_url(budget)
    title = "TextMate 2 - Budgets - Budget Tracker"
    find("title").should have_content(title)
  end

  scenario "can not create a budget without a name" do
    click_button 'Create Budget'
    page.should have_content("Budget has not been created.")
    page.should have_content("Name can't be blank")
  end
end
