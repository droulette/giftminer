class Occasion < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient
  has_many :recommendations, :dependent => :destroy
  has_many :products, :through => :recommendations
  has_and_belongs_to_many :ocats
  
  attr_accessible :date, :description, :name, :price_range, :type_of_gift, :ocat_ids, :recipient_id, :recipient_name, :user_id, :created_at, :updated_at

  validates :date, :name, :price_range, :type_of_gift, :presence => true

  scope :sorteddesc, order("date ASC")
  scope :upcoming, where('date >= ?',  Date.today)
  scope :past, where('date < ?',  Date.today)

  
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
    my_recommendations = []
    ocats_name = ocats.collect{|ocat| ocat.category }
    product_cats = ProductCat.all
    recent_product = Product.all.last
    
    if price_range == 'under $25' and type_of_gift.downcase == 'silly'
      product_cats.each do |product_cat|
        if product_cat.name == 'Other'
          product_cat.products.each do |product|
            if product.price <= 25
              my_recommendations.push(product)
            end
          end
        end
      end
    end

    if price_range == 'under $25' and type_of_gift.downcase == 'Serious'
      product_cats.each do |product_cat|
        if product_cat.name == ('Housewares') or product_cat.name == ('Food') or product_cat.name == ('Clothes')
          product_cat.products.each do |product|
            if product.price <= 25
              my_recommendations.push(product)
            end
          end
        end
      end
    end

    if price_range == 'under $25' and type_of_gift.downcase == 'Romantic'
      product_cats.each do |product_cat|
        if product_cat.name == ('Jewelry')
          product_cat.products.each do |product|
            if product.price <= 25
              my_recommendations.push(product)
            end
          end
        end
      end
    end

    if price_range == 'under $25' and type_of_gift.downcase == 'Gamer'
      product_cats.each do |product_cat|
        if product_cat.name == ('Electronics')
          product_cat.products.each do |product|
            if product.price <= 25
              my_recommendations.push(product)
            end
          end
        end
      end
    end

    if price_range == 'under $25' and type_of_gift.downcase == 'Cool'
      product_cats.each do |product_cat|
        if product_cat.name == ('Sports')
          product_cat.products.each do |product|
            if product.price <= 25
              my_recommendations.push(product)
            end
          end
        end
      end
    end

    if price_range == "$25.01-$100"
      product_cats.each do |product_cat|
        if product_cat.name == ('Clothes')
          product_cat.products.each do |product|
            if product.price > 25 && product.price<= 100
              my_recommendations.push(product)
            end
          end
        end
      end
    end

    if price_range == "$100.01-$250"
      product_cats.each do |product_cat|
        if product_cat.name == ('Electronics')
          product_cat.products.each do |product|
            if product.price > 100 && product.price<= 250
              my_recommendations.push(product)
            end
          end
        end
      end
    end

    if price_range == "$250+"
      product_cats.each do |product_cat|
        product_cat.products.each do |product|
          if product.price > 250
            my_recommendations.push(product)
          end
        end
      end
    end

    if price_range == "under $25" or price_range == "$25.01-$100" or price_range == "$100.01-$250" or price_range == "$250+"
      my_recommendations.push(recent_product)
    end

    my_recommendations.reject{|product| recommendations.find_by_product_id(product.id).owned_or_passed? if recommendations.find_by_product_id(product.id) }

  end
end
