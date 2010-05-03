class CampaignResource < ActiveRecord::Base
  ResourceTypes = ['Character', 'Item', 'Location']
  validates_presence_of :name, :public_description, :campaign_id, :resource_type
  validates_inclusion_of :resource_type, :in => ResourceTypes
  belongs_to :campaign

  default_scope order(:name)
  scope :characters, where(:resource_type=>'Character')
  scope :items, where(:resource_type=>'Item')
  scope :locations, where(:resource_type=>'Location')
  
end
