require 'spec_helper'

feature "Deleting questions" do
  scenario "Deleting a question" do
    Factory(:question, :question => "TextMate 2")
    visit "/"
    click_link "TextMate 2"
    click_link "Delete Question"
    page.should have_content("Question has been zipzap deleted.")

    visit "/"
    page.should_not have_content("TextMate 2")
  end
end
