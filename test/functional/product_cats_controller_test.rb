require 'test_helper'

class ProductCatsControllerTest < ActionController::TestCase
  setup do
    @product_cat = product_cats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_cats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_cat" do
    assert_difference('ProductCat.count') do
      post :create, product_cat: { description: @product_cat.description, name: @product_cat.name }
    end

    assert_redirected_to product_cat_path(assigns(:product_cat))
  end

  test "should show product_cat" do
    get :show, id: @product_cat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_cat
    assert_response :success
  end

  test "should update product_cat" do
    put :update, id: @product_cat, product_cat: { description: @product_cat.description, name: @product_cat.name }
    assert_redirected_to product_cat_path(assigns(:product_cat))
  end

  test "should destroy product_cat" do
    assert_difference('ProductCat.count', -1) do
      delete :destroy, id: @product_cat
    end

    assert_redirected_to product_cats_path
  end
end
