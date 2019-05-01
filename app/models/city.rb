class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true#, format: {with: /d{5}/}
  has_many :users
  has_many :gossips, through: :users
end
