class OccasionsPriceRange < ActiveRecord::Base
  belongs_to :occasion
  belongs_to :price_range
  
  attr_accessible :occasion_id, :price_range_id
end
