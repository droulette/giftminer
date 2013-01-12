class OcatsOccassion < ActiveRecord::Base
  belongs_to :ocat
  belongs_to :occassion
  
  validates :ocat_id, :occassion_id, :presence => true
  attr_accessible :ocat_id, :occassion_id

end
