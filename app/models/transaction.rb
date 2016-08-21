class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :vendor

  validates :customer, :product, :value, :vendor, presence: true
end
