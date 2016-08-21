require 'test_helper'

class PostcodeTest < ActiveSupport::TestCase
  test 'should not save postcode without value' do
    postcode = Postcode.new(city: cities(:irkutsk))
    assert_not postcode.save
  end

  test 'should save postcode without city' do
    postcode = Postcode.new(value: '664005')
    assert_not postcode.save
  end
end
