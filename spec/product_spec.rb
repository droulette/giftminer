require 'spec_helper'

describe Product do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }


  describe 'new' do

     it "returns a new product" do
       product = FactoryGirl.create(:product)
       product.should_not be_nil
     end

     it 'creates a new product category' do
       visit ('/product_cats/new')
       fill_in 'Name', :with => 'Other'
       fill_in 'Description', :with => 'huggable bear'
       click_button('Create Product cat')
       page.should have_content('successful')
     end
     


    # it 'creates a recommendation' do
      # ocat = FactoryGirl.create(:ocat)
      # #product = FactoryGirl.create(:product)
      # #productcat = FactoryGirl.create(:product_cat)
      # # category_product_link = FactoryGirl.create(:category_product_link)
      # visit ('/occasions/new')
      # fill_in 'Name', :with => '49ers super bowl party'
      # fill_in 'Description', :with => 'hey o'
      # fill_in 'Date', :with => '01/11/2013'
      # select 'under $25',:from => 'occasion_price_range'
      # select 'Gamer',:from => 'occasion_type_of_gift'
      # save_and_open_page
      # find(:css, "#occasion_ocat_ids_[value='1']").set(true)
      # click_button('Create Occasion')
      # @recommendation.should_not be_nil
    # end

  end
end
