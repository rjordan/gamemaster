require 'test_helper'

class PostTest < ActiveSupport::TestCase
  should have_db_column :title
  should have_db_column :user_id
  should have_db_column :created_at 
  should have_db_column :updated_at 
  should have_db_column :version
  should have_db_column :contents
  should validate_presence_of :title
  should validate_presence_of :contents
  should belong_to :forum
  should belong_to :user
end
