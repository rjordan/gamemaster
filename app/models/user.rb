class User < ActiveRecord::Base
  validates_presence_of :email, :password_hash
  validates_uniqueness_of :email
  attr_protected :password_hash
  has_many :campaigns
  has_and_belongs_to_many :games, :join_table=>'campaigns_players', :class_name=>'Campaign'
  
    #Returns a user if one matches the login/password combo user must be active
  def self.authenticate(email, password)
    #enc_pwd = encrypt_password(login, password)
    self.find(:first, :conditions => ["email = ? and password_hash = ?", email, password])
  end
end
