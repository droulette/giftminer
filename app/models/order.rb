class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :occasion
  belongs_to :product
  attr_accessible :quantity, :total, :occasion_id, :product_id, :user_id
  
  scope :sorteddesc, order("created_at DESC")
end
