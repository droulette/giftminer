require 'test_helper'

class OcatsControllerTest < ActionController::TestCase
  setup do
    @ocat = ocats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ocats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ocat" do
    assert_difference('Ocat.count') do
      post :create, ocat: { category: @ocat.category, description: @ocat.description }
    end

    assert_redirected_to ocat_path(assigns(:ocat))
  end

  test "should show ocat" do
    get :show, id: @ocat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ocat
    assert_response :success
  end

  test "should update ocat" do
    put :update, id: @ocat, ocat: { category: @ocat.category, description: @ocat.description }
    assert_redirected_to ocat_path(assigns(:ocat))
  end

  test "should destroy ocat" do
    assert_difference('Ocat.count', -1) do
      delete :destroy, id: @ocat
    end

    assert_redirected_to ocats_path
  end
end
