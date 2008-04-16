require File.dirname(__FILE__) + '/../test_helper'

class PostTest < ActiveSupport::TestCase
  context "A Post" do
    should_have_db_columns :title, :user_id, :created_at, :updated_at, :version, :contents
    should_require_attributes :title, :contents
    should_belong_to :forum
    should_belong_to :user
  end
end
