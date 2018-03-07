class Trip < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :accommodations, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :journeys, dependent: :destroy
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
