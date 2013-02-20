FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end  
    password 'foobar'
    confirmed_at 2013-01-01
    after(:create) { |instance| instance.recipients << create_list(:recipient, 1) }
  end

  factory :product do
    sequence :name do |n|
      "product_#{n}"
    end
    price 9
    description 'MyText'
    gender 'MyString'
    age_range 'MyString'
    after(:build) { |instance| instance.product_cats << create_list(:product_cat, 5) }
  end
  
  factory :product_cat do
    name 'Other'
    description 'cool beans'
  end

  factory :occasion do
    user
    name 'MyString'
    description 'MyText'
    date '01/01/2010'
    price_range "under $25"
    type_of_gift "silly"
    after(:build) { |instance| instance.ocats << create_list(:ocat, 1) }
  end
  
  factory :ocat do
    category 'different_name'
    description 'different'
  end

  factory :recommendation do
    product_id 8
    occasion_id 9
    user_id 9
    own 0
    pass 0
  end



end
