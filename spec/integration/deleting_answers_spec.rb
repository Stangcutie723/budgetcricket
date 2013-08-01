require 'spec_helper'

feature 'Deleting answers' do
  let!(:question) { Factory(:question) }
  let!(:answer) do
    answer =  Factory(:answer, :question => question)
  end

  before do
    visit question_answer_path(answer)
  end

  scenario "Deleting an answer" do
    click_link "Delete Answer"
    page.should have_content("Answer has been deleted.")
    page.current_url.should == question_url(question)
  end
end
