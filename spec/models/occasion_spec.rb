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

    it 'does not create occasion w/o a price min' do
      FactoryGirl.build(:occasion, :price_min => nil).should_not be_valid
    end

    it 'does not create occasion w/o a price max' do
      FactoryGirl.build(:occasion, :price_max => nil).should_not be_valid
    end

    it 'does not create occasion w/o an ocat' do
      FactoryGirl.build(:occasion, :ocat => nil).should_not be_valid
    end

    it 'has a full name' do
      occasion = FactoryGirl.build(:occasion)
      occasion.recipient_name =='MyString MyString'
    end

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

    it 'does not recommend a product owned' do
      ocat = FactoryGirl.create(:ocat, :name => 'Birthday')
      occasion = FactoryGirl.create(:occasion, :price_min => 1, :price_max => 100, :ocat_id => ocat.id)
      product = FactoryGirl.create(:product, :price => 50)
      product_cat = FactoryGirl.create(:product_cat, :name =>'Food')
      recommendation = FactoryGirl.create(:recommendation, :occasion_id => occasion.id, :product_id => product.id, :own => 1)
      category_product_link = FactoryGirl.create(:category_product_link, :product_id => product.id, :product_cat_id => product_cat.id)
      occasion.product_recommendations.should_not include(product)
    end

    it 'does not recommend a product passed' do
      ocat = FactoryGirl.create(:ocat, :name => 'Birthday')
      occasion = FactoryGirl.create(:occasion, :price_min => 1, :price_max => 100, :ocat_id => ocat.id)
      product = FactoryGirl.create(:product, :price => 50)
      product_cat = FactoryGirl.create(:product_cat, :name =>'Food')
      recommendation = FactoryGirl.create(:recommendation, :occasion_id => occasion.id, :product_id => product.id, :pass => 1)
      category_product_link = FactoryGirl.create(:category_product_link, :product_id => product.id, :product_cat_id => product_cat.id)
      occasion.product_recommendations.should_not include(product)
    end

    it "destroys the recommendation when destroyed" do
      occasion = FactoryGirl.create(:occasion, :name => "party")
      product = FactoryGirl.create(:product, :price => 50)
      recommendation = FactoryGirl.create(:recommendation, :occasion_id => occasion.id, :product_id => product.id)
      occasion.recommendations<< recommendation
      occasion.destroy
      Recommendation.all.should_not include(recommendation.id)
    end

  end
end