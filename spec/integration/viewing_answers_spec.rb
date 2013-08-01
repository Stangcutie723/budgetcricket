require 'spec_helper'

feature "Viewing answers" do
  before do
    textmate_2 = Factory(:question, :question => "TextMate 2")
    user = Factory(:user)
    answer = Factory(:answer,
            :question => textmate_2,
            :answer => "Make it shiny!")
    answer.update_attribute(:user,user)
    internet_explorer = Factory(:question, :question => "Internet Explorer")
    Factory(:answer,
            :question => internet_explorer,
            :answer => "Standards compliance")
    visit 'answers'
  end

  scenario "Viewing answers for a given question" do
    click_link "TextMate 2"
    page.should have_content("Make it shiny!")
    click_link "Make it shiny!"
    within("#answer h2") do
      page.should have_content("Make it shiny!")
    end
  end
end
