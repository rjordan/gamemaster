require 'test_helper'

class CampaignInviteTest < ActiveSupport::TestCase
  should have_db_column :email 
  should have_db_column :created_at 
  should have_db_column :updated_at
  should validate_presence_of :email
  should belong_to :campaign
end
