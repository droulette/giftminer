# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user nil
    product_references "MyString"
    occasion nil
    quantity 1
    total "9.99"
  end
end
