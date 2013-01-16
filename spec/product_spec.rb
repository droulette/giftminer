require 'spec_helper'

describe Product do
  
  before(:each) do
    user = FactoryGirl.create(:user)
    ocat = FactoryGirl.create(:ocat)
    product = FactoryGirl.create(:product)
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
      fill_in 'Name', :with => 'teddy'
      fill_in 'Description', :with => 'huggable bear'
      click_button('Create Product cat')
      page.should have_content('successful')
    end
    
    it 'creates a recommendation' do
      visit ('/occassions/new')
      fill_in 'Name', :with => '49ers super bowl party'
      fill_in 'Description', :with => 'hey o'
      fill_in 'Date', :with => '01/11/2013'
      select 'under $25',:from => 'occassion_price_range'
      select 'Silly',:from => 'occassion_type_of_gift'
      find(:css, "#occassion_ocat_ids_[value='1']").set(true)
      click_button('Create Occassion')
      page.should have_content('successful')
      
      save_and_open_page
      
    end
    

    
  end  
end
