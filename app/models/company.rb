class Company < ApplicationRecord
  has_many :locations

  validates :name, :url, presence: true
end
