class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  attr_accessible :stripe_customer_token, :user_id, :created_at, :updated_at
  
  validates :stripe_customer_token, :presence => true 
  
end
