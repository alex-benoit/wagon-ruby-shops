class Company < ApplicationRecord
  has_many :locations, dependent: :destroy
  belongs_to :category

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true

  before_validation :strip_company_name

  private

  def strip_company_name
    name.strip!
  end
end
