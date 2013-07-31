class Question < ActiveRecord::Base
  attr_accessible :question

  validates :question, :presence => true

  has_many :answers
  has_and_belongs_to_many :users
end
