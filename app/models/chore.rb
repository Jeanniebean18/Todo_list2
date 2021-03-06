class Chore < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  validates :name, presence: true
  validates :done, presence: true
  validates :user_id, presence: true
  validates :client_id, presence: true
end
