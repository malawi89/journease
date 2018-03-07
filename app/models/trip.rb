class Trip < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
