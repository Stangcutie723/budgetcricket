require 'spec_helper'

feature 'Creating Questions' do
  before do
    visit '/questions/new'
  end

  scenario "can create a question" do
    fill_in 'Question', :with => 'TextMate 2'
    click_button 'Create Question'
    page.should have_content('Dog, you just created a question!')

    question = Question.find_by_question('TextMate 2')
    page.current_url.should == question_url(question)
    title = "New Question"
  end

  scenario "can not create a question without a question" do
    click_button 'Create Question'
    page.should have_content("Oh dude, you didn't create a question.")
  end
end
