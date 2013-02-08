class Recipient < ActiveRecord::Base
  belongs_to :user
  has_many :occassions
  attr_accessible :age_range, :first_name, :gender, :last_name, :relationship, :full_name
  

end
