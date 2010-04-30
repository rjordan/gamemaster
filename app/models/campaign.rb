class Campaign < ActiveRecord::Base
  validates_presence_of :name, :user_id, :system_id, :max_players, :description
  validates_numericality_of :max_players, :interger=>true #, :greater_than_or_equal_to => self.players.count
  
  belongs_to :user
  belongs_to :system
  
  has_one :public_forum, :class_name=>'Forum', :conditions=>{:public=>true}, :dependent=>:destroy
  has_one :private_forum, :class_name=>'Forum', :conditions=>{:public=>false}, :dependent=>:destroy
  has_many :stories
  
  has_many :player_characters, :conditions=>"user_id is not null", :class_name=>'Character'
  has_many :nonplayer_characters, :conditions=>"user_id is null", :class_name=>'Character'
  has_many :players, :through=>:player_characters, :source=>:user
  
  has_many :resources, :class_name=>'CampaignResource', :dependent=>:destroy

  #def players
  #  characters.find(:all, :conditions=>'user_id is not null')
  #end
  
  before_save :create_forums
  
  def is_game_master?(user)
    self.user==user
  end
  
  def is_player?(user)
    self.players.include?(user)
  end

private

  def create_forums
    public_forum ||= Forum.new(:name=>'Public Forum')
    private_forum ||= Forum.new(:name=>'Private Forum')
  end
  
end
