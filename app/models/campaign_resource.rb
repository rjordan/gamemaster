class CampaignResource < ActiveRecord::Base
  ResourceTypes = ['Character', 'Item', 'Location']
  validates_presence_of :name, :public_description, :campaign_id, :resource_type
  validates_inclusion_of :resource_type, :in => ResourceTypes
  belongs_to :campaign
end
