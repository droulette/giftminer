class Recommendation < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  attr_accessible :product_id, :user_id
  
  validates :user_id, :product_id, :presence => true

end
