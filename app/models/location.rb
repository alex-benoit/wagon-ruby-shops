class Location < ApplicationRecord
  geocoded_by :address

  belongs_to :company

  validates :address, presence: true

  after_validation :geocode, if: :address_changed?
end
