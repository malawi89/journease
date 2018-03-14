class Journey < ApplicationRecord
  mount_uploader :booking_documents, PhotoUploader
  belongs_to :trip
  geocoded_by :arrival_location
  after_validation :geocode, if: :will_save_change_to_arrival_location?


   def slug
    "#{self.class.to_s.downcase}_#{self.id}"
  end
end
