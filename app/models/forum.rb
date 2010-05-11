class Forum < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :campaign
  has_many :posts
  
  has_many :forum_users
  has_many :users, :through=>:forum_users
  
  def has_access?(user)
    return true if self.public
    return true if self.users.includes? user
    false
  end
  
  def is_moderator?(user)
    return self.forum_users.where(:user_id=>user).first.moderator
  end
  
end
