class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :trip
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
