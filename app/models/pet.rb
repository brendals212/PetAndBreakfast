class Pet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  PET_LIST = %w[dog cat snake rabbit mice parrot ferret turtle]
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
