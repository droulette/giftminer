class Product < ActiveRecord::Base
  attr_accessible :age_range, :description, :gender, :name, :price, :pic, :category, :product_cat_id
  has_attached_file :pic, :styles => { :small => "160x120>", :thumb => "64x64>", :medium => "360x270>" }
  
  has_many :recommendations
  has_many :users, :through => :recommendations
  has_many :occasions, :through => :recommendations
  has_many :category_product_links  
  has_many :product_cats, :through => :category_product_links  
  has_many :reviews 
  
  accepts_nested_attributes_for :category_product_links
  attr_accessible :category_product_links
  
  validates :age_range, :description, :gender, :name, :price, :presence => true
  
  scope :sorteddesc, order("id DESC")

  before_destroy :destroy_recommendations

  def destroy_recommendations
    recommendations.each do |recommendation|
      recommendation.destroy
    end
  end
end