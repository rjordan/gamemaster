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
  validates_uniqueness_of :email, :nickname, :case_sensitive => false

  has_many :campaigns
  has_many :characters
  has_many :games, :through => :characters, :source => :campaign
  has_many :forum_users
  has_many :forums, :through => :forum_users


#  def to_xml(options = {})
#    options.reverse_merge! :only=>[ :id,
#                                    :email,
#                                    :nickname]
#    super(options)
#  end

#  def to_json(options = {})
#    options.reverse_merge! :include_root_in_json => true
#    options.reverse_merge! :only=>[ :id,
#                                    :email,
#                                    :nickname]
#    super(options)
#  end

end
