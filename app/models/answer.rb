class Answer < ActiveRecord::Base
  attr_accessible :answer
  belongs_to :question
  belongs_to :user
  has_and_belongs_to_many :users
  validates :answer, :presence => true, :length => { :minimum => 1 }
end
