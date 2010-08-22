require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  should have_db_column :name 
  should have_db_column :campaign_id 
  should have_db_column :revealed 
  should have_db_column :public_description 
  should have_db_column :private_description 
  should have_db_column :created_at 
  should have_db_column :updated_at 
  should have_db_column :version
  should validate_presence_of :name
  should validate_presence_of :campaign_id
  should validate_presence_of :public_description
  should belong_to :campaign
  should have_many :chapters
end
