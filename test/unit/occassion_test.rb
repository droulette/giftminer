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
end
