require 'spec_helper'

describe Occasion do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }

  describe 'index' do
    
  end


  describe 'new' do

    it 'shoul not create a blank occasion' do
      occasion = Occasion.new()
      !assert occasion.save
    end
    
    it 'should be able to create occasion with a name' do
      occasion = Occasion.new({'name'=>'birthday'})
      assert occasion.save
    end

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
      click_button('Create Occasion')
      page.should have_content('successful')
    end

    it 'creates a recommendation for price_range under $25' do
      occasion = FactoryGirl.create(:occasion, :price_range=>'under $25')
      product = FactoryGirl.create(:product, :price=>24)
      occasion.product_recommendations.should_not be_empty
    end

    it 'should not create a recommendation for price_range free' do
      occasion = FactoryGirl.create(:occasion, :price_range=>'free')
      occasion.product_recommendations.should be_empty
    end

    it 'creates a recommendation for price_range 25-100' do
      occasion = FactoryGirl.create(:occasion, :price_range=>"$25.01-$100", :type_of_gift=> 'Clothes')
      product = FactoryGirl.create(:product, :price=>50)
      occasion.product_recommendations.should_not be_empty
    end

    it 'creates a recommendation for price_range 100-250' do
      occasion = FactoryGirl.create(:occasion, :price_range=>'$100.01-$250', :type_of_gift=> 'Clothes')
      product = FactoryGirl.create(:product, :price=>240)
      occasion.product_recommendations.should_not be_empty
    end
    #
    it 'creates a recommendation for price_range 250+' do
      occasion = FactoryGirl.create(:occasion, :price_range=>'$250+')
      occasion.product_recommendations.should_not be_empty
    end

  end
end