FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'foobar'  
  end
  
  factory :product do
    sequence(:name) { |n| "abc#{n}"}
    price 9.99
    description 'MyText'
    gender 'MyString'
    age_range 'MyString'
  end
  
  factory :product_cat do
    name 'product'
    description 'cool beans'
    product
  end

  factory :occassion do
    name 'MyString'
    description 'MyText'
    date 2013-01-02
    price_range "under $25"
    type_of_gift "silly"
  end
  
  factory :ocat_occassion do
    association :ocat
    association :occassion
  end
  
  factory :ocat do
    category 'category'
    description 'my thing'
  end
 
  
end
