class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :occasion
  belongs_to :product
  has_one :subscription
  attr_accessible :quantity, :total, :occasion_id, :product_id, :user_id, 
                  :name, :address_line_1, :address_line_2, :city, :state, :zip_code, 
                  :address_id, :stripe_card_token, :subscription_id, :stripe_charge_id, :created_at, :updated_at
  
  scope :sorteddesc, order("created_at DESC")

  validates :name, :address_line_1, :city, :state, :zip_code, :presence => true

  after_save :create_shipping_address

  def create_shipping_address
    
    unless occasion.recipient.addresses.find_by_address_line_1_and_city_and_state_and_zip_code(address_line_1, city, state, zip_code)
      address = Address.new
      address.address_line_1 = address_line_1
      address.address_line_2 = address_line_2
      address.city = city
      address.state = state
      address.zip_code = zip_code
      address.address_type = 'shipping'
      address.recipient_id = occasion.recipient.id
      address.user_id = user.id
      address.save
    end
  end
  
end
