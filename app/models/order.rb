class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :occasion
  belongs_to :product
  attr_accessible :quantity, :total
end
