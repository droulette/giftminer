# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shipping_address do
    address_line_1 "MyString"
    address_line_2 "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
  end
end
