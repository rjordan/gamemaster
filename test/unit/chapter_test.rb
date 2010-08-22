require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
    should have_db_column :name 
    should have_db_column :story_id 
    should have_db_column :revealed 
    should have_db_column :public_description 
    should have_db_column :private_description 
    should have_db_column :created_at 
    should have_db_column :updated_at 
    should have_db_column :version 
    should have_db_column :position
    should validate_presence_of :name 
    should validate_presence_of :story_id 
    should validate_presence_of :public_description 
    should validate_presence_of :position
    should belong_to :story
end
