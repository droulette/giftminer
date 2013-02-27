require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :user => nil,
      :product_references => "Product References",
      :occasion => nil,
      :quantity => 1,
      :total => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Product References/)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/9.99/)
  end
end
