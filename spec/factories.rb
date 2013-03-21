FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end  
    password 'foobar'
    confirmed_at 2013-01-01
    # after(:create) { |instance| instance.recipients << create_list(:recipient, 1) }
  end

  factory :product do
    sequence :name do |n|
      "product_#{n}"
    end
    price 9
    description 'MyText'
    gender 'MyString'
    age_range 'MyString'
  end
  
  factory :product_cat do
    name 'Toys'
    description 'cool beans'
  end

  factory :category_product_link do
    product
    product_cat
  end

  factory :occasion do
    user
    ocat
    recipient
    name 'MyString'
    description 'MyText'
    date '01/01/2010'
    price_min 6
    price_max 1888
  end
  
  factory :ocat do
    sequence :name do |n|
      "test#{n}"
    end  
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
