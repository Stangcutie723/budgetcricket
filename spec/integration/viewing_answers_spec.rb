require 'spec_helper'

feature "Viewing answers" do
  before do
    textmate_2 = Factory(:question, :question => "TextMate 2")
    answer = Factory(:answer,
            :question => textmate_2,
            :answer => "Make it shiny!")
    internet_explorer = Factory(:question, :question => "Internet Explorer")
    Factory(:answer,
            :question => internet_explorer,
            :answer => "Standards compliance")
    visit '/questions/1/answers/1'
  end

  scenario "Viewing answers for a given question" do
    page.should have_content("Make it shiny!")
  end
end
