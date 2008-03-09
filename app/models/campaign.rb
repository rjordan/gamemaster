class Campaign < ActiveRecord::Base
  validates_presence_of :name, :user_id, :system_id
  belongs_to :user
  belongs_to :system
end
