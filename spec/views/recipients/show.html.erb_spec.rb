require 'spec_helper'

describe "recipients/show" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :user => nil,
      :first_name => "First Name",
      :last_name => "Last Name",
      :age_range => "Age Range",
      :gender => "Gender",
      :relation => "Relation"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Age Range/)
    rendered.should match(/Gender/)
    rendered.should match(/Relation/)
  end
end
