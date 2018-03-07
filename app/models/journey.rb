class Journey < ApplicationRecord
  belongs_to :trip
  geocoded_by :departure_location
  after_validation :geocode, if: :will_save_change_to_departure_location?
end
