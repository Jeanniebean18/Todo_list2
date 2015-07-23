class User < ActiveRecord::Base
  has_many :chores
  validates :email, presence: true
  validates :password, presence: true
end
