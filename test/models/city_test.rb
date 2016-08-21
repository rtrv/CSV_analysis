require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "should not save city without name" do
    city = City.new
    assert_not city.save
  end
end
