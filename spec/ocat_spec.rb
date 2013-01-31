require 'spec_helper'

describe Ocat do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }

  describe 'new' do

    it 'creates an ocat' do
      visit ('/ocats/new')
      fill_in 'Category', :with => 'Wedding'
      fill_in 'Description', :with => 'great balls offire'
      click_button('Create Ocat')
      save_and_open_page
      page.should have_content('successful')
    end

  end
end