class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only=>[:new, :create]
  before_filter :require_user, :only=>[:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.save do |result|
      if result
        flash[:notice] = "Welcome back, #{@user_session.attempted_record.nickname}"
        redirect_back_or_default user_path(@user_session.attempted_record)
      else
        flash[:notice] = "Login failed, please check username and password and try again."
        render :action => 'new'
      end
    end
  end

  def destroy
    user_session = UserSession.find
    user_session.destroy
    flash[:notice] = "You've been logged out."
    redirect_back_or_default new_user_session_url
  end
end
