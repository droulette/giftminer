class Recommendation < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  belongs_to :occassion
  
  attr_accessible :product_id, :user_id, :occassion_id
  
  validates :user_id, :product_id, :presence => true

end
