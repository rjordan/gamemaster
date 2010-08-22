class Post < ActiveRecord::Base
  validates_presence_of :title, :user_id, :forum_id, :contents
  belongs_to :forum
  belongs_to :user
  
  def self.page(number, options={})
    options.reverse_merge!(:per_page=>10)
    limit(options[:per_page]).offset(options[:per_page] * (number-1))
  end
  
  def self.pages(options={})
    options.reverse_merge!(:per_page=>10)
    count/options[:per_page]+1
  end
end
