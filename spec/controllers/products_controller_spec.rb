require 'spec_helper'

describe ProductsController, :type => :controller do
  login_user
  
  after(:each) do
    User.delete_all
    Product.delete_all
  end

  describe 'get index' do

    it 'populates an array of products' do
      Product.delete_all
      @products = FactoryGirl.create(:product)
      get :index
      assigns(:products).should eq([@products])
    end
    
    it 'renders index' do
      get :index
      response.should render_template :index
    end

  end

  describe 'get show' do 
    
    it 'assigns the requested product to @product' do
      @product = FactoryGirl.create(:product)
      get :show, id: @product.id
      assigns(:product).should eq(@product)
    end
    
    it 'renders the #show view' do
      get :show, id: FactoryGirl.create(:product)
      response.should render_template :show
    end
    
  end

  describe 'get new' do
    
    it 'renders a new' do
      get :new
      response.should render_template :new
    end
    
  end
  
  describe 'post create' do
    
    it 'creates a new product' do
      u = FactoryGirl.build(:product, :name => 'MyString')
      post :create, product: u.attributes
      Product.last.name.should eq('MyString')
    end
    
    it 'redirects to the new product' do
      u = FactoryGirl.build(:product)
      post :create, product: u.attributes
      response.should render_template Product.last
    end
    
  end
  
  describe 'put update' do
    
    it 'updates product' do
      @product = FactoryGirl.create(:product)
      put :update, id: @product, product: FactoryGirl.attributes_for(:product)
      assigns(:product).should eq(@product)
    end
    
    it 'updates new attributes' do
      @product = FactoryGirl.create(:product)
      put :update, id: @product, product: FactoryGirl.attributes_for(:product, name: 'jim')
      @product.reload
      @product.name.should eq('jim')
    end
    
    it 'redirects to show' do
      @product = FactoryGirl.create(:product)
      put :update, id: @product, product: FactoryGirl.attributes_for(:product)
      response.should render_template @product
    end
    
    it 'does not update new attributes' do
      @product = FactoryGirl.create(:product)
      put :update, id: @product, product: FactoryGirl.attributes_for(:product, name: nil)
      @product.reload
      @product.name.should_not eq('jim')
    end
    
  end
  
  
  describe 'delete' do
    
    it 'deletes the product' do
      @product = FactoryGirl.create(:product)
      expect{
        delete :destroy, id: @product
      }.to change(Product, :count).by(-1)
    end
    
    it 'renders index' do
      @product = FactoryGirl.create(:product)
      delete :destroy, id: @product
      response.should redirect_to products_url
    end
    
  end

end
