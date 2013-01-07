require 'test_helper'

class CategoryProductLinksControllerTest < ActionController::TestCase
  setup do
    @category_product_link = category_product_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_product_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_product_link" do
    assert_difference('CategoryProductLink.count') do
      post :create, category_product_link: {  }
    end

    assert_redirected_to category_product_link_path(assigns(:category_product_link))
  end

  test "should show category_product_link" do
    get :show, id: @category_product_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_product_link
    assert_response :success
  end

  test "should update category_product_link" do
    put :update, id: @category_product_link, category_product_link: {  }
    assert_redirected_to category_product_link_path(assigns(:category_product_link))
  end

  test "should destroy category_product_link" do
    assert_difference('CategoryProductLink.count', -1) do
      delete :destroy, id: @category_product_link
    end

    assert_redirected_to category_product_links_path
  end
end
