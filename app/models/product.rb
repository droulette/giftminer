class Product < ActiveRecord::Base
  attr_accessible :age_range, :description, :gender, :name, :price, :pic, :category, :product_cat_id, :id, :created_at, :updated_at, 
                  :pic_file_name, :pic_content_type, :pic_file_size, :pic_updated_at
  has_attached_file :pic, :styles => { :small => "160x120>", :thumb => "64x64>", :medium => "360x270>" }
  
  has_many :recommendations
  has_many :users, :through => :recommendations
  has_many :occasions, :through => :recommendations
  has_many :category_product_links  
  has_many :product_cats, :through => :category_product_links  
  has_many :reviews
  has_many :products
  
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
  
  def product_cats_names
    product_cats.collect(&:name)
  end
  
  def has_product_cats_names?(names=[])
    (product_cats_names & names).any? unless names.nil?
  end

end