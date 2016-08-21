class Address < ApplicationRecord
  belongs_to :street
  belongs_to :postcode
  belongs_to :customer

  validates :house, :street, :postcode, :customer, presence: true
  validates_with AddressValidator
end
