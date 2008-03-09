class User < ActiveRecord::Base
  validates_presence_of :email, :password_hash
  
    #Returns a user if one matches the login/password combo user must be active
  def self.authenticate(email, password)
    #enc_pwd = encrypt_password(login, password)
    self.find(:first, :conditions => ["email = ? and password_hash = ?", email, password])
  end
end
