class Ocat < ActiveRecord::Base
  attr_accessible :category, :description
  
  has_many :occasions
  
  validates :name, :description, :presence => true
end
