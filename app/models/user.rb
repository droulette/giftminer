class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :username, :gender, :birthday, 
                  :firstname, :lastname, :address_line_1, :address_line_2, :city, :state, :zip, :role, :provider, :uid,
                  :fb_url, :location, :locale, :timezone, :confirmed_at, :token, :expires_at
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  has_many :recommendations
  has_many :products, :through => :recommendations
  has_many :occasions
  has_many :reviews
  has_one :subscription
  has_many :recipients
  has_many :orders
  has_many :addresses
  
  # attr_accessible :title, :body

  ROLES = %w[admin moderator customer banned]
  
  def admin?
    self.role == 'admin'
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first || User.find_by_email(auth.info.email)
    # If we cannot find user, create a new record
    unless user
        user = User.new(password:Devise.friendly_token[0,20],provider:auth.provider,uid:auth.uid,token:auth.credentials.token,
        expires_at:auth.credentials.expires_at,firstname:auth.extra.raw_info.first_name,lastname:auth.extra.raw_info.last_name,
        username:auth.extra.raw_info.username,email:auth.extra.raw_info.email,fb_url:auth.extra.raw_info.link,
        location:auth.extra.raw_info.location,gender:auth.extra.raw_info.gender,locale:auth.extra.raw_info.locale,
        timezone:auth.extra.raw_info.timezone)
        user.confirm!
        user.save!
    end
    
    # this user already has an account with us, so we just save their facebook information
    user.update_attributes(
      provider:auth.provider,
      uid:auth.uid,
      token:auth.credentials.token,
      expires_at:auth.credentials.expires_at,
      firstname:auth.extra.raw_info.firstname,
      lastname:auth.extra.raw_info.lastname,
      username:auth.extra.raw_info.username,
      email:auth.extra.raw_info.email,
      fb_url:auth.extra.raw_info.link,
      location:auth.extra.raw_info.location,
      gender:auth.extra.raw_info.gender,
      locale:auth.extra.raw_info.locale,
      timezone:auth.extra.raw_info.timezone)
    user
  end
  
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
end
