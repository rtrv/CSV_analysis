require 'test_helper'

class StreetTest < ActiveSupport::TestCase
  test 'should not save street without name' do
    street = Street.new(city: cities(:irkutsk),
                        street_type: street_types(:street))
    assert_not street.save
  end
  test 'should not save street without street type' do
    street = Street.new(city: cities(:irkutsk), name: 'Ленина')
    assert_not street.save
  end

  test 'should not save street without city' do
    street = Street.new(street_type: street_types(:street), name: 'Ленина')
    assert_not street.save
  end
end
