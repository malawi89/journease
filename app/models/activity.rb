class Activity < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :trip
end
