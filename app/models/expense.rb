class Expense < ActiveRecord::Base
  attr_accessible :description, :budget, :title

  validates :title, :presence => true
  validates :description, :presence => true,
                          :length => { :minimum => 10 }

  belongs_to :budget
end
