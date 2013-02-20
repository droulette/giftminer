require 'spec_helper'

describe Occasion do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }
  after(:each)  { Occasion.delete_all }

  describe 'new' do

    it 'creates an occasion' do
      FactoryGirl.create(:occasion).should be_valid
    end
    
    it 'does not create occasion w/o a name' do
      FactoryGirl.build(:occasion, :name => nil).should_not be_valid
    end
    

    it 'does not create occasion w/o a date' do
      FactoryGirl.build(:occasion, :date => nil).should_not be_valid
    end

    it 'does not create occasion w/o a price range' do
      FactoryGirl.build(:occasion, :price_range => nil).should_not be_valid
    end

    it 'does not create occasion w/o a type of gift' do
      FactoryGirl.build(:occasion, :type_of_gift => nil).should_not be_valid
    end

    it 'has a full name' do
      occasion = FactoryGirl.build(:occasion)
      occasion.recipient_name =='MyString MyString'
    end

    it 'recommends a product' do
      occasion = FactoryGirl.create(:occasion)
      product = FactoryGirl.create(:product)
      occasion.product_recommendations.should include(product)
    end

    it 'does not recommend if own' do
      occasion = FactoryGirl.create(:occasion)
      product = FactoryGirl.create(:product)
      recommendation = FactoryGirl.create(:recommendation, :user_id => occasion.user_id, :occasion_id => occasion.id, :product_id =>product.id, :own => 1)
      occasion.product_recommendations.should_not include(product)
    end

    it 'does not recommend if pass' do
      occasion = FactoryGirl.create(:occasion)
      product = FactoryGirl.create(:product)
      recommendation = FactoryGirl.create(:recommendation, :user_id => occasion.user_id, :occasion_id => occasion.id, :product_id =>product.id, :pass => 1)
      occasion.product_recommendations.should_not include(product)
    end


# 
    # it 'creates a recommendation for price_range under $25' do
      # occasion = FactoryGirl.create(:occasion, :price_range=>'under $25')
      # product = FactoryGirl.create(:product, :price=>24)
      # occasion.product_recommendations.should_not be_empty
    # end
# 
    # it 'should not create a recommendation for price_range free' do
      # occasion = FactoryGirl.create(:occasion, :price_range=>'free')
      # occasion.product_recommendations.should be_empty
    # end
# 
    # it 'creates a recommendation for price_range 25-100' do
      # occasion = FactoryGirl.create(:occasion, :price_range=>"$25.01-$100", :type_of_gift=> 'Clothes')
      # product = FactoryGirl.create(:product, :price=>50)
      # occasion.product_recommendations.should_not be_empty
    # end
# 
    # it 'creates a recommendation for price_range 100-250' do
      # occasion = FactoryGirl.create(:occasion, :price_range=>'$100.01-$250', :type_of_gift=> 'Clothes')
      # product = FactoryGirl.create(:product, :price=>240)
      # occasion.product_recommendations.should_not be_empty
    # end
    # #
    # it 'creates a recommendation for price_range 250+' do
      # occasion = FactoryGirl.create(:occasion, :price_range=>'$250+')
      # occasion.product_recommendations.should_not be_empty
    # end

  end
end