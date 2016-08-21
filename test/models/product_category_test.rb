require 'test_helper'

class ProductCategoryTest < ActiveSupport::TestCase
  test 'should not save product category without name' do
    product_category = ProductCategory.new
    assert_not product_category.save
  end
end
