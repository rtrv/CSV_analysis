require 'test_helper'

class StreetTypeTest < ActiveSupport::TestCase
  test 'should not save street type without short or full name' do
    street_type = StreetType.new
    assert_not street_type.save
  end

  test 'should save street type with short or full name' do
    street_type_with_short_name = StreetType.new(short_name: 'ул.')
    street_type_with_full_name = StreetType.new(full_name: 'улица')
    assert street_type_with_full_name.save && street_type_with_short_name.save
  end
end
