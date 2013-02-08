require 'spec_helper'

describe ProductCat do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }


  describe 'new' do

     it 'creates a new product category' do
       visit ('/product_cats/new')
       fill_in 'Name', :with => 'Other'
       fill_in 'Description', :with => 'huggable bear'
       click_button('Create Product cat')
       page.should have_content('successful')
     end

  end
end
