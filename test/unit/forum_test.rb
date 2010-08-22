require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  should have_db_column :name 
  should have_db_column :campaign_id 
  should have_db_column :public 
  should have_db_column :created_at 
  should have_db_column :updated_at
  should have_db_column :version
  should validate_presence_of :name
  should belong_to :campaign
  should have_many :posts
  #subscribers?
end
