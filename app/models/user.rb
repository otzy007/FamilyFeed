class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :family
  has_many :posts
  has_many :calendars
  has_many :todos 
  has_many :checkins, :through => :posts
  has_many :comments, :through => :posts
end
