require 'test_helper'

class OccassionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save occassion" do
    occassion = Occassion.new
    occassion.name = "Occassion Name"
    occassion.date = "10/10/2013"
    occassion.type_of_gift = "I don't know"
    occassion.price_range = "puppy"
    assert occassion.save, "Occassion could not be saved: #{occassion.errors.full_messages.inspect}"
  end


  test "gets a recommendation" do
    occassion = Occassion.new
    occassion.name = "Occassion Name"
    occassion.date = "10/10/2013"
    occassion.type_of_gift = "I don't know"
    occassion.price_range = "puppy"
    occassion.save
    product = Product.new
    product.age_range = "0-2"
    product.description = "awesome"
    product.gender = "male"
    product.name = 'jonas'
  end

end
