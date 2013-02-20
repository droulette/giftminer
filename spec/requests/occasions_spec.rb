require 'spec_helper'

describe Occasion do

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  after(:each)  { User.delete_all }

  describe 'functional' do
    
    it 'creates a new occasion' do
      occasion = FactoryGirl.create(:occasion, :price_range=>'under $25')
      product = FactoryGirl.create(:product, :price=>24)
      ocat = FactoryGirl.create(:ocat)
      visit ('/occasions/new')
      fill_in 'Recipient Name', :with => 'a'
      fill_in 'Description', :with => 'hey o'
      fill_in 'Date', :with => '01/11/2013'
      fill_in 'Occasion Name', :with => '49ers super bowl party'
      select 'under $25',:from => 'occasion_price_range'
      select 'Gamer',:from => 'occasion_type_of_gift'
      find(:css, "#occasion_ocat_ids_[value='1']").set(true)
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