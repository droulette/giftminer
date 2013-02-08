require 'spec_helper'

describe "recipients/edit" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :user => nil,
      :first_name => "MyString",
      :last_name => "MyString",
      :age_range => "MyString",
      :gender => "MyString",
      :relation => "MyString"
    ))
  end

  it "renders the edit recipient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipients_path(@recipient), :method => "post" do
      assert_select "input#recipient_user", :name => "recipient[user]"
      assert_select "input#recipient_first_name", :name => "recipient[first_name]"
      assert_select "input#recipient_last_name", :name => "recipient[last_name]"
      assert_select "input#recipient_age_range", :name => "recipient[age_range]"
      assert_select "input#recipient_gender", :name => "recipient[gender]"
      assert_select "input#recipient_relation", :name => "recipient[relation]"
    end
  end
end
