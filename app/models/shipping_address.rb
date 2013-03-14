class ShippingAddress < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :city, :state, :zip_code
  
  belongs_to :recipient
  
  validates_format_of :zip_code, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
end
