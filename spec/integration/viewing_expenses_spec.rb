require 'spec_helper'

feature "Viewing expenses" do
  before do
    textmate_2 = Factory(:budget, :name => "TextMate 2")
    Factory(:expense,
            :budget => textmate_2,
            :title => "Make it shiny!",
            :description => "Gradients! Starbursts! Oh my!")

    internet_explorer = Factory(:budget, :name => "Internet Explorer")
    Factory(:expense,
            :budget => internet_explorer,
            :title => "Standards compliance",
            :description => "Isn't a joke.")
    visit '/'
  end
#page 148 scenario
end
