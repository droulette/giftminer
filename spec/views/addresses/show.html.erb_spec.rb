require 'spec_helper'

describe "addresses/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :address_line_1 => "Address Line 1",
      :addres_line_2 => "Addres Line 2",
      :city => "City",
      :state => "State",
      :zip_code => "Zip Code",
      :address_type => "Address Type",
      :recipient => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address Line 1/)
    rendered.should match(/Addres Line 2/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip Code/)
    rendered.should match(/Address Type/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
