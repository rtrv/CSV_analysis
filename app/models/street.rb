class Street < ApplicationRecord
  belongs_to :city
  belongs_to :street_type

  has_many :addresses

  validates :name, :city, :street_type, presence: true
end
