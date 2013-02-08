require 'spec_helper'

describe "subscriptions/index" do
  before(:each) do
    assign(:subscriptions, [
      stub_model(Subscription,
        :user => nil,
        :stripe_customer_token => "Stripe Customer Token"
      ),
      stub_model(Subscription,
        :user => nil,
        :stripe_customer_token => "Stripe Customer Token"
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Stripe Customer Token".to_s, :count => 2
  end
end
