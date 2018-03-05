class TripUser < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  # validates_uniqueness_of ?
  # validates :trip, presence: true
  # validates :user, presence: true
end
