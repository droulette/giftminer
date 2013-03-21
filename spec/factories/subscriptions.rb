# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    user
    stripe_customer_token "cus_1Tr4V5qs4QWpU8"
  end
end
