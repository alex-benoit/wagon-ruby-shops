class City < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    "#{name} #{country}"
  end

  private

  def address_changed?
    country_changed? || name_changed?
  end
end
