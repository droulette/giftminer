require 'spec_helper'

describe "shipping_addresses/new" do
  before(:each) do
    assign(:shipping_address, stub_model(ShippingAddress,
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString"
    ).as_new_record)
  end

  it "renders new shipping_address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shipping_addresses_path, :method => "post" do
      assert_select "input#shipping_address_address_line_1", :name => "shipping_address[address_line_1]"
      assert_select "input#shipping_address_address_line_2", :name => "shipping_address[address_line_2]"
      assert_select "input#shipping_address_city", :name => "shipping_address[city]"
      assert_select "input#shipping_address_state", :name => "shipping_address[state]"
      assert_select "input#shipping_address_zip_code", :name => "shipping_address[zip_code]"
    end
  end
end
