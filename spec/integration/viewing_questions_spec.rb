require 'spec_helper'

feature 'Viewing questions' do
  scenario "Listing all questions" do
    question = Factory.create(:question, :question => "TextMate 2")
    visit '/'
    click_link 'TextMate 2'
    page.current_url.should == question_url(question)
  end
end
