class StreetTypeValidator < ActiveModel::Validator
  def validate(record)
    if record.short_name.blank? && record.full_name.blank?
      record.errors.add(:base, "At least one name should be defined")
    end
  end
end
