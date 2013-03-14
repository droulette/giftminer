require 'spec_helper'

describe "addresses/new" do
  before(:each) do
    assign(:address, stub_model(Address,
      :address_line_1 => "MyString",
      :addres_line_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString",
      :address_type => "MyString",
      :recipient => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => addresses_path, :method => "post" do
      assert_select "input#address_address_line_1", :name => "address[address_line_1]"
      assert_select "input#address_addres_line_2", :name => "address[addres_line_2]"
      assert_select "input#address_city", :name => "address[city]"
      assert_select "input#address_state", :name => "address[state]"
      assert_select "input#address_zip_code", :name => "address[zip_code]"
      assert_select "input#address_address_type", :name => "address[address_type]"
      assert_select "input#address_recipient", :name => "address[recipient]"
      assert_select "input#address_user", :name => "address[user]"
    end
  end
end
