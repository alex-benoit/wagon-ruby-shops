class Company < ApplicationRecord
  has_many :locations
  belongs_to :category

  validates :name, :url, presence: true
end
