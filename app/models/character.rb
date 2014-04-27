class Character < ActiveRecord::Base
  validates_presence_of :name, :public_description, :statistics
  belongs_to :campaign
  belongs_to :user

  scope :player, -> { where('user_id is not null') }
  scope :nonplayer, -> { where('user_id is null') }

  def player_name
    user ? user.nickname : 'Non-Player'
  end

  def npc?
    user.nil?
  end
end
