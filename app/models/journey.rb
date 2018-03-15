class Journey < ApplicationRecord
  mount_uploader :booking_documents, PhotoUploader
  belongs_to :trip
  geocoded_by :arrival_location
  after_validation :geocode, if: :will_save_change_to_arrival_location?
  validates :sub_category, presence: true
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :departure_location, presence: true
  validates :arrival_location, presence: true


   def slug
    "#{self.class.to_s.downcase}_#{self.id}"
  end
end
