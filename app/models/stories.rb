class Story < ActiveRecord::Base
  validates_presence_of :name, :public_description, :public,:campaign_id
  belongs_to :campaign
end
