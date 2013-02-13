class Recommendation < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  belongs_to :occasion
  
  attr_accessible :product_id, :user_id, :occasion_id, :pass, :own
  
  validates :user_id, :product_id, :occasion_id, :presence => true
  
  def owned_or_passed?
    own or pass
  end
end
