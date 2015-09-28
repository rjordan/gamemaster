class CampaignInvite < ActiveRecord::Base
  belongs_to :campaign

  validates :email, presence: true
  validates :campaign_id, presence: true
end
