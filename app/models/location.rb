class Location < ActiveRecord::Base
  #acts_as_tree
  validates_presence_of :name, :public_description, :campaign_id
  belongs_to :campaign
end
