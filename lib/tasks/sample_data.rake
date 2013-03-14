namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'ffaker'
    #[User].each(&:delete_all)
    # 1.times do |n|
      # first_name  = Faker::Name.first_name
      # last_name  = Faker::Name.last_name
      # email = Faker::Internet.email
      # address_line_1 = Faker::Address.street_address
      # city = Faker::Address.city
      # state = Faker::Address.us_state_abbr
      # zip = Faker::Address.zip_code
      # password  = "password"
      # confirmed_at = 2.years.ago..Time.now
      # User.create!(firstname: first_name,
                   # lastname: last_name,
                   # email: email,
                   # address_line_1: address_line_1,
                   # city: city,
                   # state: state,
                   # zip: zip,
                   # confirmed_at: confirmed_at,
                   # password: password,
                   # password_confirmation: password)
    # end
#     
    # Product.populate 10 do |product|
      # product.name = Populator.words(1)
      # product.price = rand(1*1000)
      # product.description = Populator.sentences(3..4)
      # product.gender = ['Male','Female','Both']
      # product.age_range = ['kids','adults','any']
    # end

    # Address.populate 3 do |address|
      # address.address_line_1 = Faker::Address.street_address
      # address.city = Faker::Address.city
      # address.state = Faker::Address.us_state_abbr
      # address.zip_code = Faker::Address.zip_code
      # address.address_type = ['mailing','shipping']
      # address.user_id = 1
      # address.recipient_id = 68 
    # end    
    
    CategoryProductLink.populate 10 do |link|
      link.product_id = [78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90]
      link.product_cat_id = [3, 4, 5, 6, 7, 10, 11] 
    end
    
  end
end
