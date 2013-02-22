class GiftTypesOccasion < ActiveRecord::Base
  belongs_to :gift_type
  belongs_to :occasion

  validates :gift_type_id, :occasion_id, :presence => true
  attr_accessible :gift_type_id, :occasion_id
end
