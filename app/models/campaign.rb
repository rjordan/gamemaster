class Campaign < ActiveRecord::Base
  validates_presence_of :name, :user_id, :system_id, :max_players
  belongs_to :user
  belongs_to :system
  has_many :stories
  has_and_belongs_to_many :players, :join_table=>'campaigns_players', :class_name=>'User'
end
