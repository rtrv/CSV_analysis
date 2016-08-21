require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should not save product without name' do
    product = Product.new(product_category: product_categories(:food))
    assert_not product.save
  end

  test 'should save product without product category' do
    product = Product.new(name: 'Apple')
    assert_not product.save
  end
end
