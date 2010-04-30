require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  context "A Character" do
    should_have_db_columns :name, :campaign_id, :statistics, :public_description,
                                                      :private_description, :created_at, :updated_at, :version,
                                                      :user_id
                                                      
    should_validate_presence_of :name, :campaign_id, :public_description, :statistics
    should_belong_to :campaign, :user
  end
end
