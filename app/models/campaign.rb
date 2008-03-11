class Campaign < ActiveRecord::Base
  validates_presence_of :name, :user_id, :system_id, :public
  belongs_to :user
  belongs_to :system
  has_many :stories
end
