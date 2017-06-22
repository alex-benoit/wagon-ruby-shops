class City < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    "#{name} #{country}"
  end

  private

  has_many :locations
  has_many :companies, through: :locations

  before_validation :normalize_name_and_country

  validates :name, presence: true, uniqueness: { scope: :country,
    message: "city already exists in that country" }

  private

  def normalize_name_and_country
    self.name = name.capitalize.strip
    self.country = country.capitalize.strip
  end

  def address_changed?
    country_changed? || name_changed?
  end
end
