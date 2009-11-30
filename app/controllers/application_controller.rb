# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :set_time_zone
  helper :all # include all helpers, all the time
  layout 'default'

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '73a3a13ce984fa6487c48ef5a37c41d5'
  filter_parameter_logging :password
end
