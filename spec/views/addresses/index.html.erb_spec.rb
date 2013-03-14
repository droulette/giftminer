require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :address_line_1 => "Address Line 1",
        :addres_line_2 => "Addres Line 2",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code",
        :address_type => "Address Type",
        :recipient => nil,
        :user => nil
      ),
      stub_model(Address,
        :address_line_1 => "Address Line 1",
        :addres_line_2 => "Addres Line 2",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code",
        :address_type => "Address Type",
        :recipient => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address Line 1".to_s, :count => 2
    assert_select "tr>td", :text => "Addres Line 2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "Address Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
