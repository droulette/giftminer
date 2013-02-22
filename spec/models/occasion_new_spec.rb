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

    it 'has a full name' do
      occasion = FactoryGirl.build(:occasion)
      occasion.recipient_name =='MyString MyString'
    end

    # it 'recommends a product within range' do
      # occasion = FactoryGirl.create(:occasion, :price_min => 1, :price_max => 100)
      # product = FactoryGirl.create(:product, :price => 50)
      # occasion.product_recommendations.should include(product)
    # end
# 
    # it 'does not recommends a product outside range' do
      # occasion = FactoryGirl.create(:occasion, :price_min => 1, :price_max => 100)
      # product = FactoryGirl.create(:product, :price => 500)
      # occasion.product_recommendations.should_not include(product)
    # end

    it 'recommends a product within product/ocat name' do
      ocat = FactoryGirl.create(:ocat, :name => 'Birthday')
      occasion = FactoryGirl.create(:occasion, :price_min => 1, :price_max => 100, :ocat_id => ocat.id)
      product = FactoryGirl.create(:product, :price => 50)
      product_cat = FactoryGirl.create(:product_cat, :name =>'Food')
      category_product_link = FactoryGirl.create(:category_product_link, :product_id => product.id, :product_cat_id => product_cat.id)
      occasion.product_recommendations.should include(product)
    end

    it 'does not recommends a product outside product/ocat name' do
      ocat = FactoryGirl.create(:ocat, :name => 'Anniversary')
      occasion = FactoryGirl.create(:occasion, :price_min => 1, :price_max => 100, :ocat_id => ocat.id)
      product = FactoryGirl.create(:product, :price => 50)
      product_cat = FactoryGirl.create(:product_cat, :name =>'Food')
      category_product_link = FactoryGirl.create(:category_product_link, :product_id => product.id, :product_cat_id => product_cat.id)
      occasion.product_recommendations.should_not include(product)
    end

  end
end