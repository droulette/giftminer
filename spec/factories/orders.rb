# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    name 'Thomas'
    user
    product
    occasion
    subscription
    quantity 1
    total 99
    address_line_1 '123 fake st'
    city 'san francisco'
    state 'CA'
    zip_code '94111'
    # stripe_card_token 'tok_1VDNjw8LpxCoRM'
  end
end
