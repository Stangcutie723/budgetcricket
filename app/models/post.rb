class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :storytitle, presence: true, length: { minimum: 5 }
end
