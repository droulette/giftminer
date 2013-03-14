# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address_line_1 "MyString"
    addres_line_2 "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
    address_type "MyString"
    recipient nil
    user nil
  end
end
