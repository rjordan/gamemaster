class User < ActiveRecord::Base
    devise :database_authenticatable,
           :confirmable,
           :recoverable,
           :rememberable,
           :trackable,
           :registerable,
           :validatable,
           :lockable

  validates_presence_of :email, :nickname
  validates_uniqueness_of :email, :nickname, :case_sensitive=>false
  
  has_many :campaigns
  has_many :characters
  has_many :games, :through=>:characters, :source=>:campaign
  
end
