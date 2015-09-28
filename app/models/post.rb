class Post < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user

  validates :title, presence: true
  validates :user_id, presence: true
  validates :forum_id, presence: true
  validates :contents, presence: true
end
