require 'digest/sha1'

class User < ActiveRecord::Base
  @@salt ='7173d715c562333e909947e1902497272f2b76eb2fbaebcd31001f14aa244645'
  validates_presence_of :email, :password_hash, :nickname
  validates_uniqueness_of :email, :nickname
  attr_protected :password_hash
  has_many :campaigns
  has_many :characters
  has_many :games, :through=>:characters, :source=>:campaign
  
    #Returns a user if one matches the login/password combo user must be active
  def self.authenticate(email, password)
    enc_pwd = encrypt_password(email, password)
    self.find(:first, :conditions => ["email = ? and password_hash = ?", email, enc_pwd])
  end
  
    #Encrypts the users password using the login and a salt
  def self.encrypt_password(email, password)
    Digest::SHA1.hexdigest("#{@@salt}:#{email}:#{password}")
  end
end
