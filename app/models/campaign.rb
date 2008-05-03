class Campaign < ActiveRecord::Base
  validates_presence_of :name, :user_id, :system_id, :max_players
  validates_numericality_of :max_players, :interger=>true #, :greater_than_or_equal_to => self.players.count
  belongs_to :user
  belongs_to :system
  has_one :public_forum, :class_name=>"Forum", :conditions=>{:public=>true}, :dependent=>:destroy
  has_one :private_forum, :class_name=>"Forum", :conditions=>{:public=>false}, :dependent=>:destroy
  has_many :stories
  has_many :characters
  has_many :players, :through=>:characters, :source=>:user 
end
