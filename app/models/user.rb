class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]

  
  belongs_to :family
  has_many :posts
  has_many :calendars
  has_many :todos 
  has_many :checkins, :through => :posts
  has_many :comments, :through => :posts
  has_many :invites, :through => :family
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
   user = User.where(:provider => auth.provider, :uid => auth.uid).first
   unless user
      user = User.create(name:auth.extra.raw_info.name,
			   provider:auth.provider,
			   uid:auth.uid,
			   email:auth.info.email,
			   password:Devise.friendly_token[0,20]
			   )
   end
   user
  end
   
  def self.find_for_google_oauth2(access_token, signed_in_resource = nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
        user = User.create(name: data["name"],
	    		   email: data["email"],
	    		   password: Devise.friendly_token[0,20]
	    		  )
    end
    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
       p auth
      user = User.create!(name:auth.info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email: "#{auth.uid}@twit.ter",
                         password:Devise.friendly_token[0,20]
      )
    end
    user
  end
end
