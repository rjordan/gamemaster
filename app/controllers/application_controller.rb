# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all # include all helpers, all the time
 
  before_filter :authenticate_user!
  before_filter :set_time_zone
  
  protected

  def validate_user(model)
    throw "Something funky going on! #{model.user.inspect} != #{current_user.inspect}" if model.user != current_user
  end
  
  
  def set_time_zone
    if current_user && current_user.respond_to?(:timezone)
      Time.zone = current_user.timezone
    else
      Time.zone = 'Central Time (US & Canada)'
    end
  end
  
end
