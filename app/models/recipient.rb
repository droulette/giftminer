class Recipient < ActiveRecord::Base
  belongs_to :user
  has_many :occasions
  attr_accessible :age, :first_name, :gender, :last_name, :relationship, :recipient_name

  validates :first_name, :presence => true 
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
