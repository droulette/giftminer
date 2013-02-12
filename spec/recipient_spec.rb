require 'spec_helper'

describe Recipient do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after(:each)  { User.delete_all }
  after(:each)  { Recipient.delete_all }
  describe 'new' do

    it 'creates an recipient' do
      recipient = FactoryGirl.create(:recipient)
      visit ('/recipients')
      click_link('New Recipient')
      fill_in 'Full name', :with => 'bill nye'
      click_button('Submit')
      page.should have_content('successful')
    end

    it 'destroys a recipient', js: true do
      visit ('/recipients')
      click_link 'Destroy'
      page.evaluate_script('window.confirm = function() { return true; }')
      page.should have_content "Account deleted"
    end


    it 'edits a recipient' do
      visit ('/recipients')
      click_link 'Edit'
      fill_in 'Full name', :with => 'bill nye123'
      click_button('Submit')
      page.should have_content('successful')
      save_and_open_page
    end

it "should have 2 recipients" do
  recipient = FactoryGirl.create(:recipient)
  @recipient = Recipient.find(:all).length
  @recipient.should eq(2)

end



  end
end