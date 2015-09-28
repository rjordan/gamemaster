class User < ActiveRecord::Base
  devise :database_authenticatable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :registerable,
         :validatable,
         :lockable

  has_many :campaigns
  has_many :characters
  has_many :forum_users
  has_many :forums, through: :forum_users
  has_many :games, through: :characters, source: :campaign

  validates :email, presence: true, uniqueness:  { case_sensitive: false }
  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
end
