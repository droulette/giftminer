class Occassion < ActiveRecord::Base
  belongs_to :user
  has_many :recommendations
  has_many :products, :through => :recommendations
  has_and_belongs_to_many :ocats
  
  attr_accessible :date, :description, :name, :price_range, :type_of_gift, :ocat_ids

  validates :date, :description, :name, :price_range, :type_of_gift, :presence => true
  
  scope :sorteddesc, order("date ASC")
  scope :upcoming, where('date > ?',  Date.today)
  scope :past, where('date < ?',  Date.today)
  
  #after_save :create_recommendations
  
  before_destroy :destroy_recommendations
  
  def save_recommendation(product_id)
    recommendation = Recommendation.new
    recommendation.user_id = user_id
    recommendation.product_id = product_id
    recommendation.occassion_id = id
    recommendation.save
  end
  
  def create_recommendations
    ocats_name = ocats.collect{|ocat| ocat.category }
    product_cats = ProductCat.all
    if recommendations.length  > 0
      recommendations.each do |recommendation|
        recommendation.destroy
      end
    end
    if price_range == 'under $25' and type_of_gift.downcase == 'silly' and (ocats_name.include?('Birthday') or ocats_name.include?('anniversary'))
      product_cats.each do |product_cat|
        if product_cat.name == ('Food')
          product_cat.products.each do |product|
            save_recommendation(product.id)
          end
        end
      end
    elsif price_range == 'under $25'
      product_cats.each do |product_cat|
        if product_cat.name == ('Electronics')
          product_cat.products.each do |product|
            save_recommendation(product.id)
          end
        end    
      end
    elsif price_range == "$25.01-$100" or price_range == "$100.01-$250"
      product_cats.each do |product_cat|
        if product_cat.name == ('Clothes')
          product_cat.products.each do |product|
            save_recommendation(product.id)
          end
        end    
      end
    else if product_cat.last
          save_recommendation(product_cat.last.products.last.id) 
      end
    end
  end
  
  def destroy_recommendations
    recommendations.each do |recommendation|
      recommendation.destroy
    end
  end
  
  
  
  def product_recommendations
    my_recommendations = []
    ocats_name = ocats.collect{|ocat| ocat.category }
    product_cats = ProductCat.all
    recent_product = Product.all.last
    if price_range == 'under $25' and type_of_gift.downcase == 'silly' and (ocats_name.include?('Birthday') or ocats_name.include?('anniversary'))
      product_cats.each do |product_cat|
        if product_cat.name == ('Food')
          product_cat.products.each do |product|
            my_recommendations.push(product)
          end
        end
      end
    elsif price_range == 'under $25'
      product_cats.each do |product_cat|
        if product_cat.name == ('Electronics')
          product_cat.products.each do |product|
            my_recommendations.push(product)
          end
        end
      end
    elsif price_range == "$25.01-$100" or price_range == "$100.01-$250"
      product_cats.each do |product_cat|
        if product_cat.name == ('Clothes')
          product_cat.products.each do |product|
            my_recommendations.push(product)
          end
        end
      end
    else 
      my_recommendations.push(recent_product)
    end
    
    my_recommendations
  end

  
end
  