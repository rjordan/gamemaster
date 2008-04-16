class Forum < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :campaign
  has_many :posts
end
