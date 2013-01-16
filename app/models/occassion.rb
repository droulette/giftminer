class Occassion < ActiveRecord::Base
  belongs_to :user
  has_many :recommendations
  has_many :products, :through => :recommendations
  has_and_belongs_to_many :ocats
  
  attr_accessible :date, :description, :name, :price_range, :type_of_gift, :ocat_ids

  validates :date, :description, :name, :price_range, :type_of_gift, :presence => true
  
  after_save :create_recommendations
  
  def save_recommendation(product_id)
    recommendation = Recommendation.new
    recommendation.user_id = user_id
    #recommendation.product_id = product_cat.id
    recommendation.product_id = product_id
    recommendation.occassion_id = id
    recommendation.save
  end
  
  def create_recommendations
    ocats_name = ocats.collect{|ocat| ocat.category }
    product_cat = ProductCat.all
    if recommendations.length  > 0
      recommendations.each do |recommendation|
        recommendation.destroy
      end
    end
    if price_range == 'under $25' and type_of_gift.downcase == 'silly' and (ocats_name.include?('Birthday') or ocats_name.include?('anniversary'))
      product_cat.each do |product_cat|
        if product_cat.name == ('Food')
          save_recommendation(product_cat.products.first.id)            
        end
      end
    elsif price_range == 'under $25'
      product_cat.each do |product_cat|
        if product_cat.name == ('Electronics')
          save_recommendation(product_cat.products.first.id)  
        end    
      end
    elsif price_range == "$25.01-$100" or price_range == "$100.01-$250"
      product_cat.each do |product_cat|
        if product_cat.name == ('Clothes')
          save_recommendation(product_cat.products.first.id)  
        end    
      end
    else if product_cat.last
      product_cat.each do |product_cat|
        if product_cat.last
          save_recommendation(product_cat.products.last.id)  
        end
      end
    end
  end
end
end
  