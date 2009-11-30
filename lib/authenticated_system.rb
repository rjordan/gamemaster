#borrowed from Gullery
module AuthenticatedSystem

protected

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to :back
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def logged_in?
    current_user.nil? ? false : true
  end

  def set_time_zone
    #Time.zone = @current_user.time_zone if @current_user
    Time.zone = 'Central Time (US & Canada)'
  end

  #==== OLD STUFF ===


  # store the given user in the session.  overwrite this to set how
  # users are stored in the session.  To store the whole user model, do:
  #
  #   def current_user=(new_user)
  #     session[:user] = new_user
  #   end
  #
  #def current_user=(new_user)
  #  session[:user] = new_user.nil? ? nil : new_user.id
  #  @current_user = new_user
  #end

  # overwrite this if you want to restrict access to only a few actions
  # or if you want to check if the user has the correct rights
  # example:
  #
  #  # only allow nonbobs
  #  def authorize?(user)
  #    user.login != "bob"
  #  end
  def authorized?(user)
     true
  end

  # overwrite this method if you only want to protect certain actions of the controller
  # example:
  #
  #  # don't protect the login and the about method
  #  def protect?(action)
  #    if ['action', 'about'].include?(action)
  #       return false
  #    else
  #       return true
  #    end
  #  end
  def protect?(action)
    true
  end

  # To require logins, use:
  #
  #   before_filter :login_required                            # restrict all actions
  #   before_filter :login_required, :only => [:edit, :update] # only restrict these actions
  #
  # To skip this in a subclassed controller:
  #
  #   skip_before_filter :login_required
  #
  def login_required
    # skip login check if action is not protected
    return true unless protect?(action_name)

    # check if user is logged in and authorized
    return true if logged_in? and authorized?(current_user)

    # store current location so that we can
    # come back after the user logged in
    store_location

    # call overwriteable reaction to unauthorized access
    access_denied and return false
  end

  # overwrite if you want to have special behavior in case the user is not authorized
  # to access the current operation.
  # the default action is to redirect to the login screen
  # example use :
  # a popup window might just close itself for instance
  def access_denied
    redirect_to new_session_path
  end

  # adds ActionView helper methods
  def self.included(base)
    base.send :helper_method, :current_user, :logged_in?
  end
end