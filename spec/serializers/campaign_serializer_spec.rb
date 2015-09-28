require 'rails_helper'

describe CampaignSerializer do
  it { expect_valid_serialized_model(:campaign) }
end
