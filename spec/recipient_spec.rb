require 'spec_helper'

describe Recipient do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }

  describe 'new' do

    it 'creates an recipient' do

      visit ('/recipients/new')
      fill_in 'Full name', :with => 'bill nye'
      click_button('Submit')
      save_and_open_page
      page.should have_content('successful')
    end

  end
end