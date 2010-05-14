class CampaignInvite < ActiveRecord::Base
  validates_presence_of :email, :campaign_id
  belongs_to :campaign
end
