class Occassion < ActiveRecord::Base
  belongs_to :user
  has_many :recommendations
  has_many :products, :through => :recommendations
  
  attr_accessible :date, :description, :name, :price_range, :type_of_gift

  validates :date, :description, :name, :price_range, :type_of_gift, :presence => true
  
end