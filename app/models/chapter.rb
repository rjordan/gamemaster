class Chapter < ActiveRecord::Base
  validates_presence_of :name, :public_description, :story_id, :position
  validates_numericality_of :position, :story_id
  belongs_to :story
  acts_as_list :scope => :story
end
