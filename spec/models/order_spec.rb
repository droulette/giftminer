require 'spec_helper'

describe Order do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }
  after(:each)  { Order.delete_all }

  describe 'new' do

    it 'creates an order' do
      FactoryGirl.create(:order).should be_valid
    end
    
    it 'does not create order w/o a name' do
      FactoryGirl.build(:order, :name => nil).should_not be_valid
    end

    it 'does not create order w/o a address' do
      FactoryGirl.build(:order, :address_line_1 => nil).should_not be_valid
    end

    it 'does not create order w/o a city' do
      FactoryGirl.build(:order, :city => nil).should_not be_valid
    end
    
    it 'does not create order w/o a state' do
      FactoryGirl.build(:order, :state => nil).should_not be_valid
    end

    it 'does not create order w/o a zip' do
      FactoryGirl.build(:order, :zip_code => nil).should_not be_valid
    end
  end
end
