class System < ActiveRecord::Base
  has_many :campaigns

  validates :name, presence: true
end
