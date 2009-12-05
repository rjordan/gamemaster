class StoriesController < ApplicationController
  before_filter :require_user

  def index
    @stories = Story.find(:all)
    respond_to do |format|
      format.html
      format.xml { render :xml => @stories }
    end
  end
  
  def show
    @story = Story.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @story }
    end
  end
  
  def new
    @story = Story.new
    @story.campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    @story = Story.new(params[:story])
    @story.campaign_id = params[:campaign_id]
    if @story.save
      flash[:notice] = "The story was created successfully!"
      redirect_to story_path(@story) and return
    end
    render :action=>:new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update_attributes(params[:story])
    if @story.save
      flash[:notice] = "The story was updated successfully!"
      redirect_to story_path(@story) and return
    end
    render :action=>:edit
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy
    flash[:notice] = "The specified story has been removed!"
    redirect_to campaign_stories_path(story.campaign)
  end

end