# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all # include all helpers, all the time

  before_filter :set_time_zone
  
  protected
  
  def set_time_zone
  end
  
  def require_user
    unless current_user
      flash[:error] = t(:must_login)
      redirect_to new_user_session_path 
    end
  end
end
