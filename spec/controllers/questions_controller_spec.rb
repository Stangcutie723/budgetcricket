require 'spec_helper'

describe QuestionsController do
  it "displays an error for a missing question" do
    get :show, :id => "not-here"
    response.should redirect_to(questions_path)
    message = "The question you were looking for could not be found."
    flash[:alert].should == message
  end
end
