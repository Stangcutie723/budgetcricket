class Question < ActiveRecord::Base
  attr_accessible :question

  validates :question, :presence => true

  has_many :answers
end
