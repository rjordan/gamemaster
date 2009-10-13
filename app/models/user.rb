class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end
  validates_presence_of :email, :nickname
  validates_uniqueness_of :email, :nickname, :case_sensitive=>false
  has_many :campaigns
  has_many :characters
  has_many :games, :through=>:characters, :source=>:campaign

  private

  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.nickname = registration["nickname"] if nickname.blank?
  end
end
