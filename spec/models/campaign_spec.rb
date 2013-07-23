require 'spec_helper'

describe Campaign do
  it { should have_db_column :name }
  it { should have_db_column :user_id }
  it { should have_db_column :system_id }
  it { should have_db_column :max_players } 
  it { should have_db_column :public }
  it { should have_db_column :created_at } 
  it { should have_db_column :updated_at }
  it { should have_db_column :version }
  it { should validate_presence_of :name } 
  it { should validate_presence_of :user_id } 
  it { should validate_presence_of :system_id }
  it { should validate_presence_of :max_players }
  it { should belong_to :user }
  it { should belong_to :system }
  it { should have_one(:private_forum).dependent(:destroy) }
  it { should have_one(:public_forum).dependent(:destroy) }
  it { should have_many :stories }
  it { should have_many :players }
  it { should have_many :player_characters }
  it { should have_many :nonplayer_characters }
  it { should validate_numericality_of :max_players }
  it { should have_many :resources }
end
