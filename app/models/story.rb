class Story < ActiveRecord::Base
  belongs_to :campaign
  has_many :chapters # , -> { order: 'position' }

  validates :name, presence: true
  validates :public_description, presence: true
  validates :campaign_id, presence: true

  # default_scope -> { order(:name) }
end
