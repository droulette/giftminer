class Product < ActiveRecord::Base
  attr_accessible :age_range, :description, :gender, :name, :price, :pic, :category, :product_cat_id
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  has_many :recommendations
  has_many :users, :through => :recommendations
  has_many :occassions, :through => :recommendations
  has_many :category_product_links  
  has_many :product_cats, :through => :category_product_links  
  
  accepts_nested_attributes_for :product_cats
  
  validates :age_range, :description, :gender, :name, :price, :presence => true
end
