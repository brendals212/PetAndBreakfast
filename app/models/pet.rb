class Pet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
