class ForumsController < ApplicationController
  
  def index
    @forums = Forum.find(:all, :order=>'name', :conditions=>{:public=>true, :campaign_id=>nil} )
    respond_to do |format|
      format.html
      format.xml { render :xml => @forums }
    end
  end
  
  def show
    @forum = Forum.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @forum }
    end
  end
  
  def new
    @forum = Forum.new
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def destroy
    forum = Forum.find(params[:id])
    forum.destroy
    flash[:notice] = "The specified forum has been removed!"
    redirect_to forums_path
  end
  
  def update
    @forum = Forum.find(params[:id])
    @forum.update_attributes(params[:forum])
    if @forum.save
      flash[:notice] = "The forum was updated successfully!"
      redirect_to forum_path(@forum) and return
    end
    render :action=>:edit
  end
  
  def create
    @forum = Forum.new(params[:forum])
    #@forum.user_id = User.find(:first).id
    if @forum.save
      flash[:notice] = "The forum was created successfully!"
      redirect_to forum_path(@forum) and return
    end
    render :action=>:new
  end
   
end