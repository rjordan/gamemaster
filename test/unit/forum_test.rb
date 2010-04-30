require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  context "A Forum" do
    should_have_db_columns :name, :campaign_id, :public, :created_at, :updated_at, :version
    should_validate_presence_of :name
    should_belong_to :campaign
    should_have_many :posts
    #subscribers?
  end
end
