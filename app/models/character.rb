class Character < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user

  validates :name, presence: true
  validates :public_description, presence: true
  validates :statistics, presence: true

  scope :player, -> { where('user_id is not null') }
  scope :nonplayer, -> { where('user_id is null') }

  def player_name
    user ? user.nickname : 'Non-Player'
  end

  def npc?
    user.nil?
  end
end
