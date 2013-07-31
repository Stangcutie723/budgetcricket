require 'spec_helper'

feature "Editing Answers" do
  let!(:question) { Factory(:question) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:answer) do
    answer =  Factory(:answer, :question => question)
    answer.update_attribute(:user, user)
    answer
  end

  before do
    sign_in_as!(user)
    visit '/'
    click_link question.question
    click_link answer.answer
    click_link "Edit Answer"
  end

  scenario "Updating an answer" do
    fill_in "Answer", :with => "Make it really shiny!"
    click_button "Update Answer"
    page.should have_content "Answer has been updated."
    within("#answer h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content answer.answer
  end

  scenario "Updating a answer with invalid information" do
    fill_in "Answer", :with => ""
    click_button "Update Answer"
end
end
