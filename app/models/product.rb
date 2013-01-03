class Product < ActiveRecord::Base
  attr_accessible :age_range, :description, :gender, :name, :price
  has_many :recommendations
  has_many :users, :through => :recommendations
end
