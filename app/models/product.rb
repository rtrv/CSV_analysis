class Product < ApplicationRecord
  belongs_to :product_category

  has_many :transactions

  validates :name, :product_category, presence: true
end
