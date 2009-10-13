class System < ActiveRecord::Base
  validates_presence_of :name
  has_many :campaigns
end
