class Campaign < ActiveRecord::Base
  validates_presence_of :name, :user_id, :system_id, :max_players, :description
  validates_numericality_of :max_players, interger: true #, :greater_than_or_equal_to => self.players.count

  belongs_to :user
  belongs_to :system

  has_one :public_forum, -> { where(public: true) }, class_name: 'Forum', dependent: :destroy
  has_one :private_forum, -> { where(public: false) }, class_name: 'Forum', dependent: :destroy
  has_many :stories

  has_many :characters, dependent: :destroy
  has_many :player_characters, -> { where('user_id is not null') }, :class_name => 'Character'
  has_many :nonplayer_characters, -> { where('user_id is null') }, :class_name => 'Character'
  has_many :players, through: :player_characters, source: :user

  has_many :invites, :class_name => 'CampaignInvite'

  has_many :resources, class_name: 'CampaignResource', dependent: :destroy
#  delegate :characters, :locations, :items, to: :resources
  after_initialize :build_forums

  def game_master?(user)
    self.user==user
  end

  def player?(user)
    self.players.include?(user)
  end

  private

  def build_forums
    build_public_forum(name: 'Public Forum')
    build_private_forum(name: 'Private Forum')
  end
end

############################

#class Campaign
#  include Mongoid::Document

#  field :name, type: String
#embeds_many :instruments
#end

#class Instrument
#  include Mongoid::Document
#  field :name, type: String
#  embedded_in :artist
#end
