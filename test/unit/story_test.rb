require File.dirname(__FILE__) + '/../test_helper'

class StoryTest < ActiveSupport::TestCase
  context "A Story" do
    should_have_db_columns :name, :campaign_id, :public, :public_description,
                                                      :private_description, :created_at, :updated_at, :version
    should_require_attributes :name, :campaign_id, :public_description
    should_belong_to :campaign
  end
end
