require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  context "A Story" do
    should_have_db_columns :name, :campaign_id, :public, :public_description,
                                                      :private_description, :created_at, :updated_at, :version,
                                                      :position
    should_validate_presence_of :name, :campaign_id, :public_description, :position
    should_belong_to :campaign
    should_have_many :chapters
  end
end
