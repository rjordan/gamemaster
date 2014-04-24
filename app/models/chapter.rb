class Chapter < ActiveRecord::Base
  belongs_to :story

  validates_presence_of :name, :public_description, :story_id, :position
  validates_numericality_of :position

  acts_as_list :scope => :story
end
