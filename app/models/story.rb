class Story < ActiveRecord::Base
  validates_presence_of :name, :public_description, :campaign_id, :position
  validates_numericality_of :position, :campaign_id
  belongs_to :campaign
  has_many :chapters
end
