require 'spec_helper'

feature "Editing Answers" do
  let!(:question) { Factory(:question) }
  let!(:answer) do
    answer =  Factory(:answer, :question => question)
    answer
  end

  before do
    visit '/questions/1/answers/1/edit'
  end

  scenario "Updating an answer" do
    fill_in "Answer", :with => "Make it really shiny!"
    click_button "Update Answer"
    page.should have_content "Answer has been updated."

    page.should_not have_content answer.answer
  end

  scenario "Updating a answer with invalid information" do
    fill_in "Answer", :with => ""
    click_button "Update Answer"
end
end
