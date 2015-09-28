class Forum < ActiveRecord::Base
  belongs_to :campaign
  has_many :posts
  has_many :forum_users
  has_many :users, through: :forum_users

  validates :name, presence: true

  scope :closed, -> { where(public: false) }
  scope :open, -> { where(public: true) }

  def title
    "#{campaign.name}: #{name}"
  end

  def allowed?(user)
    return true if public
    return true if users.includes? user
    false
  end

  def moderator?(user)
    forum_users.find_by(user_id: user).moderator
  end
end
