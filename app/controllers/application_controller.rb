class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_time_zone
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  protected

  def set_time_zone
    if current_user && current_user.respond_to?(:timezone)
      Time.zone = current_user.timezone
    else
      Time.zone = 'Central Time (US & Canada)'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nickname
  end
end
