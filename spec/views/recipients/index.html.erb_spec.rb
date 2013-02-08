require 'spec_helper'

describe "recipients/index" do
  before(:each) do
    assign(:recipients, [
      stub_model(Recipient,
        :user => nil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :age_range => "Age Range",
        :gender => "Gender",
        :relation => "Relation"
      ),
      stub_model(Recipient,
        :user => nil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :age_range => "Age Range",
        :gender => "Gender",
        :relation => "Relation"
      )
    ])
  end

  it "renders a list of recipients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Age Range".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Relation".to_s, :count => 2
  end
end
