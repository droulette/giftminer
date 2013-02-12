require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save product" do
    product = Product.new
    product.age_range = "0-2"
    product.description = "awesome"
    product.name = "jonas"
    product.gender = "male"
    product.price = "googol dollars"
    assert product.save, "Product could not be saved: #{product.errors.full_messages.inspect}"
  end

  test "should not save product" do
    product = Product.new
    product.age_range = "0-2"
    product.description = "awesome"
    product.gender = "male"
    product.name = 'jonas'
    assert !product.save, "Product could not be saved: #{product.errors.full_messages.inspect}"
  end

end
