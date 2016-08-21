class StreetType < ApplicationRecord
  has_many :streets

  validates_with StreetTypeValidator
end
