require 'test_helper'

class CampaignInviteTest < ActiveSupport::TestCase
  should_have_db_columns :email, :created_at, :updated_at

  should_validate_presence_of :email
  should_belong_to :campaign
end
