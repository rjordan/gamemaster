require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  context "A Location" do
    should_have_db_columns :name, :campaign_id, :public_description,
                           :created_at, :updated_at, :version, :user_id

    should_validate_presence_of :name, :campaign_id, :public_description
    should_belong_to :campaign, :user
  end
end
