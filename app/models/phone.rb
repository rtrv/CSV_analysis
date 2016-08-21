class Phone < ApplicationRecord
  belongs_to :customer

  validates :value, :customer, presence: true
  validates :value, format: { with: /\(\d{3}\)\d{3}-\d{2}-\d{2}/ }
end
