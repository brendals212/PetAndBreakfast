class Pet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookings
  mount_uploader :photo, PhotoUploader
end
