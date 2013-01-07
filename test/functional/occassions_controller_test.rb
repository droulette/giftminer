require 'test_helper'

class OccassionsControllerTest < ActionController::TestCase
  setup do
    @occassion = occassions(:one)
    @user = users(:one)
    sign_in @user 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:occassions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create occassion" do
    assert_difference('Occassion.count') do
      post :create, occassion: { date: @occassion.date, description: @occassion.description, name: @occassion.name, price_range: @occassion.price_range, type_of_gift: @occassion.type_of_gift }
    end

    assert_redirected_to occassion_path(assigns(:occassion))
  end

  test "should show occassion" do
    get :show, id: @occassion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @occassion
    assert_response :success
  end

  test "should update occassion" do
    put :update, id: @occassion, occassion: { date: @occassion.date, description: @occassion.description, name: @occassion.name, price_range: @occassion.price_range, type_of_gift: @occassion.type_of_gift }
    assert_redirected_to occassion_path(assigns(:occassion))
  end

  test "should destroy occassion" do
    assert_difference('Occassion.count', -1) do
      delete :destroy, id: @occassion
    end

    assert_redirected_to occassions_path
  end
  
  
  
end
