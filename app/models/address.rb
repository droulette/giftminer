class Address < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :user
  
  attr_accessible :address_line_2, :address_line_1, :address_type, :city, :state, :zip_code, :recipient_id, :user_id
  
  # validates_format_of :zip_code, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
end
