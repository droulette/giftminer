require 'test_helper'

class RecommendationsControllerTest < ActionController::TestCase
  setup do
    @recs = recommendations(:one)
    @user = users(:one)
    sign_in @user 
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
