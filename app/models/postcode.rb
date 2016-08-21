class Postcode < ApplicationRecord
  belongs_to :city

  has_many :addresses

  validates :value, :city, presence: true
end
