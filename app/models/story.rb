class Story < ActiveRecord::Base
  validates_presence_of :name, :public_description, :campaign_id
  validates_numericality_of :campaign_id
  belongs_to :campaign
  has_many :chapters
  default_scope order(:name)
end
