class Chore < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :done, presence: true
  validates :user_id, presence: true
end
