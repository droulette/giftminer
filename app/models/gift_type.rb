class GiftType < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_and_belongs_to_many :occasions
  
  validates :name, :presence => true
end
