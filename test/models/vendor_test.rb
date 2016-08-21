require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  test 'should not save vendor without name' do
    vendor = Vendor.new
    assert_not vendor.save
  end
end
