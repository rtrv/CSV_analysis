require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  test 'should not save phone without value' do
    phone = Phone.new(customer: customers(:first_customer))
    assert_not phone.save
  end

  test 'should not save phone without customer' do
    phone = Phone.new(value: '(987)654-32-10')
    assert_not phone.save
  end

  test 'should not save invalid phone' do
    phone = Phone.new(customer: customers(:first_customer), value: '123456')
    assert_not phone.save
  end

  test 'should save valid phone' do
    phone = Phone.new(customer: customers(:first_customer),
                      value: '(987)654-32-10')
    assert phone.save
  end
end
