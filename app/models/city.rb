class City < ApplicationRecord
  has_many :postcodes
  has_many :streets

  validates :name, presence: true
end
