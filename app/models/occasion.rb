class Occasion < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient
  has_many :recommendations, :dependent => :destroy
  has_many :products, :through => :recommendations
  has_and_belongs_to_many :gift_types
  belongs_to :ocat
  
  attr_accessible :date, :description, :name, :price_max, :price_min, :gift_type, :ocat_ids, :recipient_id, :recipient_name, 
                  :user_id, :created_at, :updated_at, :gift_type_ids, :ocat_id

  validates :date, :name, :price_max, :price_min, :ocat_id, :presence => true

  scope :sorteddesc, order("date ASC")
  scope :upcoming, where('date >= ?',  Date.today)
  scope :past, where('date < ?',  Date.today)
  
  MINERMAGIC = {
    'Birthday' => ['Cookware','Food'],
    'Anniversary' => ['Clothes'],
    'Christmas' => ['Toys'],
    'Hanakah' => ['Electronics'],
    'Sorry' => ['Furniture'],
    'Other' => ['Housewares']
  }
  
  def recipient_name
    recipient.try(:full_name)
  end
  
  def recipient_name=(name)
    if user and !name.nil?
      name = name.split(' ')
      self.recipient = user.recipients.find_by_first_name_and_last_name(name[0],name[1]) || user.recipients.create({'first_name' => name[0],'last_name' => name[1]})
    end
  end

  def product_recommendations
    product_cats = ProductCat.all
    
    # select product in the price_range
    products = Product.all.select{|product| (price_min..price_max) === product.price }
   
    # map ocat to product_cats
    products.select!{|product| product.has_product_cats_names?(MINERMAGIC[ocat.name]) }
    
    # reject product that are owned or passed
    products.reject{|product| recommendations.find_by_product_id(product.id).owned_or_passed? if recommendations.find_by_product_id(product.id) }
  end
end
