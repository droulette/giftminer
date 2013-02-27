require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :user => nil,
        :product_references => "Product References",
        :occasion => nil,
        :quantity => 1,
        :total => "9.99"
      ),
      stub_model(Order,
        :user => nil,
        :product_references => "Product References",
        :occasion => nil,
        :quantity => 1,
        :total => "9.99"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Product References".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
