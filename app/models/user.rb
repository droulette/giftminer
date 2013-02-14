class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :username, :gender, :birthday, :firstname, :lastname, :address_line_1, :address_line_2, :city, :state, :zip
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  has_many :recommendations
  has_many :products, :through => :recommendations
  has_many :occasions
  has_many :reviews
  has_one :subscription
  has_many :recipients
  # attr_accessible :title, :body

  ROLES = %w[admin moderator customer banned]
  
  def admin?
    role == 'admin'
  end
  
end
