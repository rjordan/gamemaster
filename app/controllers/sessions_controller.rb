class SessionsController < ApplicationController
  
  # GET /sessions/new
  def new
  end
  
  # POST /sessions
  # POST /sessions.xml
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.email}!"
      redirect_to campaigns_url 
    else
      flash[:error] = "Invalid user/password combination!"
      render :action => 'new'
    end
  end
    
  # DELETE /sessions
  # DELETE /sessions
  def destroy
    reset_session
    flash[:notice] = "You've been logged out."
    redirect_to new_session_url
  end
end
