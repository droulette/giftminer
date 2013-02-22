require 'spec_helper'

describe Occasion do

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  after(:each)  { User.delete_all }

  describe 'functional' do
    
    it 'creates a new occasion' do
      ocat = FactoryGirl.create(:ocat)
      gift_types = FactoryGirl.create(:gift_type)
      occasion = FactoryGirl.create(:occasion, :price_min =>1, :price_max =>100)
      product = FactoryGirl.create(:product, :price=>24)
      ocat = FactoryGirl.create(:ocat)
      visit ('/occasions/new')
      save_and_open_page
      fill_in 'Recipient Name', :with => 'a'
      fill_in 'Description', :with => 'hey o'
      fill_in 'Date', :with => '01/11/2013'
      fill_in 'Occasion Name', :with => '49ers super bowl party'
      fill_in 'Price Minimum',:with => 1
      fill_in 'Price Maximum',:with => 100
      find(:css, "#occasion_gift_type_ids_[value='1']").set(true)
      select 'test1', :from => "occasion_ocat_id"
      click_button('Submit')
      page.should have_content('49ers')
    end

    it 'deletes an occasion' do
      @occasion = FactoryGirl.create(:occasion, :description => 'hello world', :user => @user)
      visit ('/occasions')
      expect{
         click_link 'Delete'
      }.to change(Occasion, :count).by(-1)
      page.should_not have_content 'hello world'
    end
  end
  
end