require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "should not save customer without raw name" do
    customer = Customer.new
    assert_not customer.save
  end
end
