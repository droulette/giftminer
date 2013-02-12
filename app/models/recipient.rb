class Recipient < ActiveRecord::Base
  belongs_to :user
  has_many :occassions
  attr_accessible :age_range, :first_name, :gender, :last_name, :relationship, :recipient_name

  def full_name
    "#{first_name} #{last_name}"
  end

end
