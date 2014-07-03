require 'spec_helper'

describe CampaignInvite, type: :model do
  it { expect(subject).to have_db_column(:email) }
  it { expect(subject).to have_db_column(:created_at) }
  it { expect(subject).to have_db_column(:updated_at) }

  it { expect(subject).to validate_presence_of :email }

  it { expect(subject).to belong_to :campaign }
end
