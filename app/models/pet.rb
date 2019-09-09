class Pet < ApplicationRecord
  belongs_to :user, optional: true
  validates :photo, presence: true

end
