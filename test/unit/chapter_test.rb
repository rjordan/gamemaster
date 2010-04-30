require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  context "A Chapter" do
    should_have_db_columns :name, :story_id, :public, :public_description,
                                                      :private_description, :created_at, :updated_at, :version,
                                                      :position
    should_validate_presence_of :name, :story_id, :public_description, :position
    should_belong_to :story
  end
end
