require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  should_have_db_columns :name, :campaign_id, :revealed, :public_description,
                                        :private_description, :created_at, :updated_at, :version
  should_validate_presence_of :name, :campaign_id, :public_description
  should_belong_to :campaign
  should_have_many :chapters
end
