class Expense < ActiveRecord::Base
  attr_accessible :description, :budget, :title, :cost

  validates :title, :presence => true
  validates :cost, :presence => true

  belongs_to :budget
end
