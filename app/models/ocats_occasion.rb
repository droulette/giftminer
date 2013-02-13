class OcatsOccasion < ActiveRecord::Base
  belongs_to :ocat
  belongs_to :occasion
  
  validates :ocat_id, :occasion_id, :presence => true
  attr_accessible :ocat_id, :occasion_id

end
