class Company < ApplicationRecord
  has_many :locations
  belongs_to :category

  validates :name, :url, presence: true, uniqueness: { case_sensitive: false }

  before_validation :strip_company_name

  private

  def strip_company_name
    name.strip!
  end
end
