class Campaign < ActiveRecord::Base
  validates_presence_of :name, :user_id, :system_id
end
