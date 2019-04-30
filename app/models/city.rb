class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true#, format: {with: /d{5}/}
end
