require 'spec_helper'

describe Occassion do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }

  describe 'new' do

    it 'creates a new record' do
      Occassion.new.should be_a(Occassion)
    end

    it 'creates a new occassion' do
      occassion = FactoryGirl.create(:occassion, :price_range=>'under $25')
      product = FactoryGirl.create(:product, :price=>24)
      ocat = FactoryGirl.create(:ocat)
      visit ('/occassions/new')
      fill_in 'Recipient Name', :with => 'a'
      fill_in 'Description', :with => 'hey o'
      fill_in 'Date', :with => '01/11/2013'
      fill_in 'Occasion Name', :with => '49ers super bowl party'
      select 'under $25',:from => 'occassion_price_range'
      select 'Gamer',:from => 'occassion_type_of_gift'
      find(:css, "#occassion_ocat_ids_[value='1']").set(true)
      click_button('Create Occassion')
      page.should have_content('successful')
    end

    it 'creates a recommendation for price_range under $25' do
      occassion = FactoryGirl.create(:occassion, :price_range=>'under $25')
      product = FactoryGirl.create(:product, :price=>24)
      occassion.product_recommendations.should_not be_empty
    end

    it 'should not create a recommendation for price_range free' do
      occassion = FactoryGirl.create(:occassion, :price_range=>'free')
      occassion.product_recommendations.should be_empty
    end

    it 'creates a recommendation for price_range 25-100' do
      occassion = FactoryGirl.create(:occassion, :price_range=>"$25.01-$100", :type_of_gift=> 'Clothes')
      product = FactoryGirl.create(:product, :price=>50)
      occassion.product_recommendations.should_not be_empty
    end

    it 'creates a recommendation for price_range 100-250' do
      occassion = FactoryGirl.create(:occassion, :price_range=>'$100.01-$250', :type_of_gift=> 'Clothes')
      product = FactoryGirl.create(:product, :price=>240)
      occassion.product_recommendations.should_not be_empty
    end
    #
    it 'creates a recommendation for price_range 250+' do
      occassion = FactoryGirl.create(:occassion, :price_range=>'$250+')
      occassion.product_recommendations.should_not be_empty
    end

  end
end