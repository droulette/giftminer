require 'spec_helper'

describe "subscriptions/edit" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :user => nil,
      :stripe_customer_token => "MyString"
    ))
  end

  it "renders the edit subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subscriptions_path(@subscription), :method => "post" do
      assert_select "input#subscription_user", :name => "subscription[user]"
      assert_select "input#subscription_stripe_customer_token", :name => "subscription[stripe_customer_token]"
    end
  end
end
