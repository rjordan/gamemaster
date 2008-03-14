class Story < ActiveRecord::Base
  validates_presence_of :name, :public_description, :campaign_id
  belongs_to :campaign
end
