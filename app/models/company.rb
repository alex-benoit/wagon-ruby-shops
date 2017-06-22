class Company < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :cities, through: :locations
  belongs_to :category

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true

  before_validation :strip_company_name, :normalize_url

  private

  def strip_company_name
    name.strip!
  end

  def normalize_url
    self.url = url.strip.gsub(/(www.)|(http:\/\/)|(https:\/\/)/, '').prepend('http://www.') unless url.nil?
  end
end
