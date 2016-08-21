require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test 'should not save address without house' do
    address = Address.new(postcode: postcodes(:irkutsk_postcode),
                          street: streets(:lenin_st_irkutsk),
                          customer: customers(:first_customer))
    assert_not address.save
  end

  test 'should not save address without customer' do
    address = Address.new(postcode: postcodes(:irkutsk_postcode),
                          street: streets(:lenin_st_irkutsk),
                          house: '1')
    assert_not address.save
  end

  test 'should not save address without street' do
    address = Address.new(postcode: postcodes(:irkutsk_postcode),
                          customer: customers(:first_customer),
                          house: '1')
    assert_not address.save
  end

  test 'should not save address without postcode' do
    address = Address.new(street: streets(:lenin_st_irkutsk),
                          customer: customers(:first_customer),
                          house: '1')
    assert_not address.save
  end

  test 'should save address with street and postcode from one city' do
    address = Address.new(postcode: postcodes(:irkutsk_postcode),
                          street: streets(:lenin_st_irkutsk),
                          customer: customers(:first_customer),
                          house: '1')
    assert address.save
  end

  test 'should not save address with street and postcode from different cities' do
    address = Address.new(postcode: postcodes(:irkutsk_postcode),
                          street: streets(:lenin_st_moscow),
                          customer: customers(:first_customer),
                          house: '1')
    assert_not address.save
  end
end
