class Recommendation < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  belongs_to :occassion
  
  attr_accessible :product_id, :user_id, :occassion_id, :pass, :own
  
  validates :user_id, :product_id, :occassion_id, :presence => true
  
  def owned_or_passed?
    own or pass
  end
end
