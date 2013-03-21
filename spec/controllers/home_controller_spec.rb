require 'spec_helper'

describe HomeController, :type => :controller do
  login_user

  after(:each) do
    User.delete_all
  end

  describe "pages" do
    
    it "returns dashboard if logged in" do
      get 'index'
      response.should redirect_to home_dashboard_path
    end

    # it "returns index if logged out" do
      # @user = FactoryGirl.create(:user)
      # controller.stub!(:current_user).and_return(@user)
      # delete :sign_out
      # get 'index'
      # response.should be_success
    # end

    it "returns dashboard" do
      get 'dashboard'
      response.should be_success
    end

    it "returns about us" do
      get 'about_us'
      response.should be_success
    end

    it "returns contact us" do
      get 'contact_us'
      response.should be_success
    end

    it "returns support" do
      get 'support'
      response.should be_success
    end

    it "returns thank you" do
      get 'thank_you'
      response.should be_success
    end

  end

end
