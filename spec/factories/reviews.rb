# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    product nil
    user nil
    rating 1
    review "MyText"
    recommend false
  end
end
