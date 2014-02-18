require 'spec_helper'

describe CampaignInvite do
  it { should have_db_column(:email) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }
  it { should validate_presence_of :email }
  it { should belong_to :campaign }
end
