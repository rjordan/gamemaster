class Campaign < ActiveRecord::Base
  belongs_to :user
  belongs_to :system
  has_many :forums, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :characters, dependent: :destroy
  has_many :invites, class_name: 'CampaignInvite', dependent: :destroy
  has_many :resources, class_name: 'CampaignResource', dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true
  validates :system_id, presence: true
  validates :max_players, presence: true, numericality: :only_integer
  validates :description, presence: true

  after_initialize :build_forums

  def game_master?(user)
    self.user == user
  end

  def player?(user)
    characters.player.where(user: user).any?
  end

  def public_forum
    forums.open.first
  end

  def private_forum
    forums.closed.first
  end

  private

  def build_forums
    forums.build(name: 'Public Forum', public: true)
    forums.build(name: 'Private Forum', public: false)
  end
end

############################

# class Campaign
#  include Mongoid::Document

#  field :name, type: String
# embeds_many :instruments
# end

# class Instrument
#  include Mongoid::Document
#  field :name, type: String
#  embedded_in :artist
# end
