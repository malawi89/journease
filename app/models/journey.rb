class Journey < ApplicationRecord
  belongs_to :trip
  geocoded_by :arrival_location
  after_validation :geocode, if: :will_save_change_to_arrival_location?
end
