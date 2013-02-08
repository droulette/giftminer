# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipient do
    user nil
    first_name "MyString"
    last_name "MyString"
    age_range "MyString"
    gender "MyString"
    relation "MyString"
  end
end
