require File.dirname(__FILE__) + '/../test_helper'

class CharacterTest < ActiveSupport::TestCase
  context "A Character" do
    should_have_db_columns :name, :campaign_id, :statistics, :public_description,
                                                      :private_description, :created_at, :updated_at, :version,
                                                      :user_id
                                                      
    should_require_attributes :name, :campaign_id, :public_description, :statistics
    should_belong_to :campaign, :user
  end
end
