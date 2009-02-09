class Character < ActiveRecord::Base
  validates_presence_of :name, :public_description, :campaign_id, :statistics
  validates_numericality_of :campaign_id
  validates_numericality_of :user_id, :allow_nil=>true
  belongs_to :campaign
  belongs_to :user

  def player_name
    user.nickname if user
  end
end
