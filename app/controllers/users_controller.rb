class UsersController < ApplicationController

  def index
    @users = User.find(:all)
    respond_to do |format|
      format.html
      format.xml { render :xml => @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end
  
#  def new
#    @user = User.new
#  end
#
#  def edit
#    @user = User.find(params[:id])
#  end
#
#  def destroy
#    user = User.find(params[:id])
#    user.destroy
#    flash[:notice] = "The specified user has been removed!"
#    redirect_to users_path
#  end
#
#  def update
#    @user = User.find(params[:id])
#    @user.update_attributes(params[:story])
#    if @user.save
#      flash[:notice] = "The user was updated successfully!"
#      redirect_to user_path(@user) and return
#    end
#    render :action=>:edit
#  end
#
#  def create
#    @user = User.new(params[:user])
#    @user.change_password(@user.password, @user.password_confirmation)
#    if @user.save
#      flash[:notice] = "The user was created successfully!"
#      redirect_to user_path(@user) and return
#    end
#    render :action=>:new
#  end

end