FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end  
    password 'foobar'
    confirmed_at 2013-01-01
 end

  factory :product do
    sequence :name do |n|
      "product_#{n}"
    end
    price 9.99
    description 'MyText'
    gender 'MyString'
    age_range 'MyString'
    
    after(:build) { |instance| instance.product_cats << create_list(:product_cat, 5) }
  end
  
  factory :product_cat do
    name 'Other'
    description 'cool beans'
  end

  factory :occassion do
    user
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
    category 'different_name'
    description 'different'
  end



end
