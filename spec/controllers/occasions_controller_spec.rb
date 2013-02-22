require 'spec_helper'

describe OccasionsController, :type => :controller do
  login_user
  after(:each)  { User.delete_all }

  describe 'get index' do

    it 'populates an array of occasions' do
      @user = FactoryGirl.create(:user)
      controller.stub!(:current_user).and_return(@user)
      @occasions = FactoryGirl.create_list(:occasion, 5, :user => @user)
      @user.occasions.stub!(:all).and_return(@occasions)
      get :index
      assigns(:occasions).should == @occasions

    end
    
    it 'renders index' do
      get :index
      response.should render_template :index
    end

  end

  describe 'get show' do 
    
    it 'assigns the requested occasion to @occasion' do
      @user = FactoryGirl.create(:user)
      @ocat = FactoryGirl.create(:ocat)
      @occasion = FactoryGirl.create(:occasion, :user_id => @user.id, :ocat_id => @ocat.id)
      @product = FactoryGirl.create(:product)
      @my_recommendation = FactoryGirl.create(:recommendation, :product_id => @product.id, :occasion_id => @occasion.id, :user_id => @user.id)
      get :show, id: @occasion.id
      assigns(:occasion).should eq(@occasion)
    end
    
    it 'renders the #show view' do
      get :show, id: FactoryGirl.create(:occasion)
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
    
    it 'creates a new occasion' do
      u = FactoryGirl.build(:occasion)
      post :create, occasion: u.attributes
      Occasion.last.name.should eq('MyString')
    end
    
    it 'redirects to the new occasion' do
      u = FactoryGirl.build(:occasion)
      post :create, occasion: u.attributes
      response.should render_template Occasion.last
    end
    
  end
  
  describe 'put update' do
    
    it 'updates occasion' do
      @occasion = FactoryGirl.create(:occasion)
      put :update, id: @occasion, occasion: FactoryGirl.attributes_for(:occasion)
      assigns(:occasion).should eq(@occasion)
    end
    
    it 'updates new attributes' do
      @occasion = FactoryGirl.create(:occasion)
      put :update, id: @occasion, occasion: FactoryGirl.attributes_for(:occasion, name: 'jim', date: '2020-02-02')
      @occasion.reload
      @occasion.name.should eq('jim')
    end
    
    it 'redirects to show' do
      @occasion = FactoryGirl.create(:occasion)
      put :update, id: @occasion, occasion: FactoryGirl.attributes_for(:occasion)
      response.should render_template @occasion
    end
    
    it 'does not update new attributes' do
      @occasion = FactoryGirl.create(:occasion)
      put :update, id: @occasion, occasion: FactoryGirl.attributes_for(:occasion, name: 'jim', date: nil)
      @occasion.reload
      @occasion.name.should_not eq('jim')
    end
    
  end
  
  
  describe 'delete' do
    
    it 'deletes the occasion' do
      @occasion = FactoryGirl.create(:occasion)
      expect{
        delete :destroy, id: @occasion
      }.to change(Occasion, :count).by(-1)
    end
    
    it 'renders index' do
      @occasion = FactoryGirl.create(:occasion)
      delete :destroy, id: @occasion
      response.should redirect_to occasions_url
    end
    
  end

end
