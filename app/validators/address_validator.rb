class AddressValidator < ActiveModel::Validator
  def validate(record)
    unless record.street&.city == record.postcode&.city
      record.errors.add(:base, 'Postcode and street are from different cities')
    end
  end
end
