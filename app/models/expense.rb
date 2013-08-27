class Expense < ActiveRecord::Base
  attr_accessible :description, :budget, :title, :cost


  validates :title, :presence => true
  validates :cost, :presence => true

  belongs_to :budget

  def to_s
    ActionController::Base.helpers.number_to_currency(cost)
  end

end
