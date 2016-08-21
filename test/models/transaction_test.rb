require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test 'should not save transaction without customer' do
    transaction = Transaction.new(value: 5,
                                  vendor: vendors(:foodshop),
                                  product: products(:apple))
    assert_not transaction.save
  end

  test 'should not save transaction without vendor' do
    transaction = Transaction.new(value: 5,
                                  product: products(:apple),
                                  customer: customers(:first_customer))
    assert_not transaction.save
  end

  test 'should not save transaction without product' do
    transaction = Transaction.new(value: 5,
                                  vendor: vendors(:foodshop),
                                  customer: customers(:first_customer))
    assert_not transaction.save
  end

  test 'should not save transaction without value' do
    transaction = Transaction.new(vendor: vendors(:foodshop),
                                  product: products(:apple),
                                  customer: customers(:first_customer))
    assert_not transaction.save
  end
end
