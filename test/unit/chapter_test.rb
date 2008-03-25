require File.dirname(__FILE__) + '/../test_helper'

class ChapterTest < ActiveSupport::TestCase
  context "A Chapter" do
    should_have_db_columns :name, :story_id, :public, :public_description,
                                                      :private_description, :created_at, :updated_at, :version,
                                                      :position
    should_require_attributes :name, :story_id, :public_description, :position
    should_belong_to :story
  end
end
