require 'spec_helper'

describe BudgetsController do

  it "displays an error for a missing budget" do
    get :show, :id => "not-here"
    response.should redirect_to(budgets_path)
    message = "The budget you were looking for could not be found."
    flash[:alert].should == message
  end

end
