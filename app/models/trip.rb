class Trip < ApplicationRecord
  has_many :users, through :trip_users
  has_many :trip_users, dependent: :destroy
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_name, presence: true
  validates :start_location, presence: true
  validates :end_location, presence: true
end
