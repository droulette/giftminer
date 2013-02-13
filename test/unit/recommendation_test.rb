require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save recommendation" do
    recommendation = Recommendation.new
    recommendation.occasion_id = 8
    recommendation.user_id = 4
    recommendation.product_id = 8
    assert recommendation.save, "recommendation could not be saved: #{recommendation.errors.full_messages.inspect}"
  end

  test "should not save recommendation" do
    recommendation = Recommendation.new
    recommendation.occasion_id = 6
    recommendation.user_id = 4
    assert !recommendation.save
  end
  
end
