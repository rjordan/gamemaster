class ForumUser < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user

  # TODO: before_create if forum !require_approval set approved=true
end
