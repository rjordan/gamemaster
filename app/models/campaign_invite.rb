class CampaignInvite < ActiveRecord::Base
  validates_presence_of :email
  belongs_to :campaign
end
