require 'spec_helper'

feature "Creating Answers" do
  before do
    Factory(:question, :question => "Internet Explorer")
    visit '/questions/1/answers/new'
  end

  scenario "Creating an answer" do
    fill_in "Answer", :with => "Non-standards compliance"
    click_button "Create Answer"
    page.should have_content("Answer has been created.")
  end

  scenario "Creating an answer without valid attributes fails" do
    click_button "Create Answer"
    page.should have_content("Answer has not been created.")
    page.should have_content("Answer can't be blank")
  end

  scenario "Answer must be longer than 1 character" do
    fill_in "Answer", :with => "Answer has not been created."
    click_button "Create Answer"
    page.should have_content("Answer has not been created.")
  end
end
