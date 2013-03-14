class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :occasion
  belongs_to :product
  attr_accessible :quantity, :total, :occasion_id, :product_id, :user_id, :address_line_1, :address_line_2, :city, :state, :zip_code, :address_id
  
  scope :sorteddesc, order("created_at DESC")
      
  validates :address_line_1, :city, :state, :zip_code, :presence => true
      
  # after_save :create_shipping_address

  def create_shipping_address
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
