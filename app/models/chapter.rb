class Chapter < ActiveRecord::Base
  belongs_to :story

  validates :name, presence: true
  validates :public_description, presence: true
  validates :story_id, presence: true
  validates :position, presence: true, numericality: :only_integer

  acts_as_list scope: :story
end
