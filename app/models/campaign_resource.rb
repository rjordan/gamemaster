class CampaignResource < ActiveRecord::Base
  include ActionView::Helpers

  belongs_to :campaign
  validates :campaign, presence: true

  RESOURCE_TYPES = %w(Character Item Location).freeze
  validates :resource_type, presence: true, inclusion: RESOURCE_TYPES

  validates :name, presence: true
  validates :public_description, presence: true

  # default_scope -> { order(:name) }
  scope :characters, -> { where(resource_type: 'Character') }
  scope :items, -> { where(resource_type: 'Item') }
  scope :locations, -> { where(resource_type: 'Location') }

  before_save :sanitize_text

  private

  def sanitize_text
    self.public_description = sanitize(public_description)
    self.private_description = sanitize(private_description)
  end
end
