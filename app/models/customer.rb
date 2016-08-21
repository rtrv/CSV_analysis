class Customer < ApplicationRecord
  has_many :addresses
  has_many :phones
  has_many :transactions

  validates :raw_name, presence: true
end
