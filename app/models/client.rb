class Client < ActiveRecord::Base
  
  has_many :chores
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
 
  # has many appts.
  # has many passwords
  # has many todos
end
