class Recipient < ActiveRecord::Base
  belongs_to :user
  
  has_many :occasions
  has_many :orders, :through => :occasions
  has_many :addresses, :dependent => :destroy
  
  # WRITE A DAMN NOTE KEVIN!!!
  accepts_nested_attributes_for :addresses, :reject_if => proc { |attributes| attributes.all? { |k, v| 
    k == 'address_type' or 
    k == 'user_id' or 
    k == 'recipient_id' or
    v.blank?
  }}
  
  attr_accessible :age, :first_name, :gender, :last_name, :relationship, :recipient_name, :addresses_attributes

  validates :first_name, :presence => true 
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
