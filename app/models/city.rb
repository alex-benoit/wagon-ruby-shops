class City < ApplicationRecord
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
end
