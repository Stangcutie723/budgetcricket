class Budget < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :presence => true

  has_many :expenses, :dependent => :delete_all


end
