class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  mount_uploader :booking_documents, PhotoUploader
  belongs_to :trip
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :sub_category, presence: true
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true

  def slug
    "#{self.class.to_s.downcase}_#{self.id}"
  end
end
