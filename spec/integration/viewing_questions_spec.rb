require 'spec_helper'

feature 'Viewing questions' do
  scenario "Listing all questions" do
    question = Factory.create(:question, :question => "TextMate 2")
    visit 'questions'
  end
end
