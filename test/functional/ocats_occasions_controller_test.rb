require 'test_helper'

class OcatOccasionsControllerTest < ActionController::TestCase
  setup do
    @ocat_occasion = ocat_occasions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ocat_occasions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ocat_occasion" do
    assert_difference('OcatOccasion.count') do
      post :create, ocat_occasion: {  }
    end

    assert_redirected_to ocat_occasion_path(assigns(:ocat_occasion))
  end

  test "should show ocat_occasion" do
    get :show, id: @ocat_occasion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ocat_occasion
    assert_response :success
  end

  test "should update ocat_occasion" do
    put :update, id: @ocat_occasion, ocat_occasion: {  }
    assert_redirected_to ocat_occasion_path(assigns(:ocat_occasion))
  end

  test "should destroy ocat_occasion" do
    assert_difference('OcatOccasion.count', -1) do
      delete :destroy, id: @ocat_occasion
    end

    assert_redirected_to ocat_occasions_path
  end
end
