class Product < ActiveRecord::Base
  attr_accessible :age_range, :description, :gender, :name, :price, :pic, :category, :product_cat_id
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>", :croppable => "600x600>" }
  
  has_many :recommendations
  has_many :users, :through => :recommendations
  has_many :occassions, :through => :recommendations
  has_many :category_product_links  
  has_many :product_cats, :through => :category_product_links  
  has_many :reviews 
  
  accepts_nested_attributes_for :category_product_links
  attr_accessible :category_product_links
  
  validates :age_range, :description, :gender, :name, :price, :presence => true
  
  scope :sorteddesc, order("id DESC")

  after_save :add_recommendation

  before_destroy :destroy_recommendations

  def save_recommendation(user_id, occassion_id, product_id)
    recommendation = Recommendation.new
    recommendation.user_id = user_id
    recommendation.product_id = product_id
    recommendation.occassion_id = occassion_id
    recommendation.save
  end
  
  
  def add_recommendation
    occass = Occassion.all
    
    occass.each do |occas|
      ocat_categories = occas.ocats ? occas.ocats.collect{|ocat| ocat.category } : []
      product_categories = product_cats ? product_cats.collect{|product_category| product_category.name } : []
      if occas.price_range == 'under $25' and occas.type_of_gift.downcase == 'silly' and (ocat_categories.include?('Birthday') or ocat_categories.include?('anniversary')) and product_categories.include?('Food')
        occas.recommendations.each do |recommendation|
          recommendation.destroy
        end
        save_recommendation(occas.user.id, occas.id, id)  
      elsif occas.price_range == 'under $25' and product_categories.include?('Electronics')
        occas.recommendations.each do |recommendation|
          recommendation.destroy
        end
        save_recommendation(occas.user.id, occas.id, id)  
      elsif (occas.price_range == "$25.01-$100" or occas.price_range == "$100.01-$250") and product_categories.include?('Clothes')
        occas.recommendations.each do |recommendation|
          recommendation.destroy
        end
        save_recommendation(occas.user.id, occas.id, id)  
      end
    end if product_cats
  end
  
  def destroy_recommendations
    recommendations.each do |recommendation|
      recommendation.destroy
    end
  end
end