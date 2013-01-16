class ProductCat < ActiveRecord::Base
  attr_accessible :description, :name, :product_cat_id
  
  has_many :category_product_links  
  has_many :products, :through => :category_product_links 
  validates :description, :name, :presence => true 
end
