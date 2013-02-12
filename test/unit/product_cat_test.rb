require 'test_helper'

class ProductCatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save product cat" do
    productcat = ProductCat.new
    productcat.name = "Hello"
    productcat.description = "hi"
    assert productcat.save, "Product Cat could not be saved: #{productcat.errors.full_messages.inspect}"
  end

  test "should not save product cat" do
    productcat = ProductCat.new
    productcat.name = "Hello"
    assert !productcat.save
  end

end
