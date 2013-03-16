class Occasion < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient
  has_many :recommendations, :dependent => :destroy
  has_many :products, :through => :recommendations
  has_and_belongs_to_many :gift_types
  belongs_to :ocat
  has_many :orders
  
  attr_accessible :date, :description, :name, :price_max, :price_min, :gift_type, :ocat_ids, :recipient_id, :recipient_name, 
                  :user_id, :created_at, :updated_at, :gift_type_ids, :ocat_id

  validates :date, :name, :price_max, :price_min, :ocat_id, :presence => true
  validates :price_min, :numericality => {greater_than: 0, less_than_or_equal_to: :price_max}, :unless => Proc.new{|occasion| occasion.price_min.nil? || occasion.price_max.nil? }

  scope :sorteddesc, order("date DESC")
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
    # in case if occasion doesnt have price min or max
    self.price_min ||= 1
    self.price_max ||= 10000
    
    # select product in the price_range
    products = Product.all.select{|product| (self.price_min..self.price_max) === product.price }

    # map ocat to product_cats
    products.select!{|product| product.has_product_cats_names?(MINERMAGIC[ocat.name]) } if ocat

    # reject product that are owned or passed
    products.reject! do |product|
      next true if recommendations.find_by_product_id(product.id) and recommendations.find_by_product_id(product.id).owned_or_passed?
      
      next true if orders.find_by_product_id(product.id)
      
      next true if recipient and recipient.orders and recipient.orders.find_by_product_id(product.id)
    end
    
    products
  end
end
