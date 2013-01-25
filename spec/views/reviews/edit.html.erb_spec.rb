require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :product => nil,
      :user => nil,
      :rating => 1,
      :review => "MyText",
      :recommend => false
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path(@review), :method => "post" do
      assert_select "input#review_product", :name => "review[product]"
      assert_select "input#review_user", :name => "review[user]"
      assert_select "input#review_rating", :name => "review[rating]"
      assert_select "textarea#review_review", :name => "review[review]"
      assert_select "input#review_recommend", :name => "review[recommend]"
    end
  end
end
