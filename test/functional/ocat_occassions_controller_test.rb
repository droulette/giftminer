require 'test_helper'

class OcatOccassionsControllerTest < ActionController::TestCase
  setup do
    @ocat_occassion = ocat_occassions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ocat_occassions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ocat_occassion" do
    assert_difference('OcatOccassion.count') do
      post :create, ocat_occassion: {  }
    end

    assert_redirected_to ocat_occassion_path(assigns(:ocat_occassion))
  end

  test "should show ocat_occassion" do
    get :show, id: @ocat_occassion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ocat_occassion
    assert_response :success
  end

  test "should update ocat_occassion" do
    put :update, id: @ocat_occassion, ocat_occassion: {  }
    assert_redirected_to ocat_occassion_path(assigns(:ocat_occassion))
  end

  test "should destroy ocat_occassion" do
    assert_difference('OcatOccassion.count', -1) do
      delete :destroy, id: @ocat_occassion
    end

    assert_redirected_to ocat_occassions_path
  end
end
