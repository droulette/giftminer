# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipient do
    first_name "MyString"
    last_name "MyString"
    age_range "MyString"
    gender "MyString"
    relationship "MyString"
  end
end
