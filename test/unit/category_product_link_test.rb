require 'test_helper'

class CategoryProductLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save category product links" do
    category_product_link = CategoryProductLink.new
    category_product_link.product_id = "Hello"
    category_product_link.product_cat_id = "hi"
    assert category_product_link.save, "cateogry product links could not be saved: #{category_product_link.errors.full_messages.inspect}"
  end

  test "should not save category_product_link" do
    category_product_link = CategoryProductLink.new
    category_product_link.product_id = "Hello"
    assert !category_product_link.save
  end
end
