require 'test_helper'

class OccasionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save occasion" do
    occasion = Occasion.new
    occasion.name = "Occasion Name"
    occasion.date = "10/10/2013"
    occasion.type_of_gift = "I don't know"
    occasion.price_range = "puppy"
    assert occasion.save, "Occasion could not be saved: #{occasion.errors.full_messages.inspect}"
  end


  test "gets a recommendation" do
    occasion = Occasion.new
    occasion.name = "Occasion Name"
    occasion.date = "10/10/2013"
    occasion.type_of_gift = "I don't know"
    occasion.price_range = "puppy"
    occasion.save
    product = Product.new
    product.age_range = "0-2"
    product.description = "awesome"
    product.gender = "male"
    product.name = 'jonas'
  end

end
