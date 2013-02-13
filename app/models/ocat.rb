class Ocat < ActiveRecord::Base
  attr_accessible :category, :description
  
  has_and_belongs_to_many :occasions
  validates :category, :description, :presence => true
end
