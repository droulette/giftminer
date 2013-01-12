class Occassion < ActiveRecord::Base
  belongs_to :user
  has_many :recommendations
  has_many :products, :through => :recommendations
  has_and_belongs_to_many :ocats
  
  attr_accessible :date, :description, :name, :price_range, :type_of_gift, :ocat_ids

  validates :date, :description, :name, :price_range, :type_of_gift, :presence => true
  
  after_save :create_recommendations
  
  def create_recommendations
    debugger
    
    ocats_name = ocats.collect{|ocat| ocat.category }
    if price_range == 'under $25' and type_of_gift.downcase == 'silly' and (ocats_name.include?('birthday') or ocats_name.include?('anniversary'))
          if product_cat = ProductCat.find_by_category('food').first
            product_cat.products
            debugger
          end
          nil
    end
  end
  
end