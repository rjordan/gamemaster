class Post < ActiveRecord::Base
  validates_presence_of :title, :user_id, :forum_id, :contents
  belongs_to :forum
  belongs_to :user
end
