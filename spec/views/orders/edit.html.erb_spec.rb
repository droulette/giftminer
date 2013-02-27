require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :user => nil,
      :product_references => "MyString",
      :occasion => nil,
      :quantity => 1,
      :total => "9.99"
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path(@order), :method => "post" do
      assert_select "input#order_user", :name => "order[user]"
      assert_select "input#order_product_references", :name => "order[product_references]"
      assert_select "input#order_occasion", :name => "order[occasion]"
      assert_select "input#order_quantity", :name => "order[quantity]"
      assert_select "input#order_total", :name => "order[total]"
    end
  end
end
