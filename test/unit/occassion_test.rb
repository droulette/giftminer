require 'test_helper'

class OccassionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  setup do
    @ocat = ocats(:one)
  end
  
  test 'should create a recommendation' do
    occassion = Occassion.new
    occassion.name = 'Kevin\'s Birthday'
    occassion.description = 'This is his birthday'
    occassion.user_id = 1
    occassion.price_range = 'under $25' 
    occassion.type_of_gift = 'Silly'
    occassion.ocat_ids = [@ocat.id]
    occassion.date = '2013-01-05 16:42:33'
    occassion.save
    assert_equal 1, occassion.recommendations.length
  end 
end
