class TripUser < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  validates :user, uniqueness: { scope: :trip }
  validates :trip, presence: true
  validates :user, presence: true
end
