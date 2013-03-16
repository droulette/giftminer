class CategoryProductLink < ActiveRecord::Base
  belongs_to :product_cat
  belongs_to :product
  attr_accessible :product_cat_id, :product_id

  validates_uniqueness_of :product_cat_id, :scope => :product_id
end
