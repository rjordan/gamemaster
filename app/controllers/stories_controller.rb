class StoriesController < ApplicationController
  before_action :find_campaign
  respond_to :html

  def index
    @stories = Story.all
    respond_with @stories
  end
  
  def show
    @story = Story.find(params[:id])
    respond_with @story
  end
  
  def new
    @story = Story.new
    @story.campaign = Campaign.find(params[:campaign_id])
    respond_with @story
  end
  
  def create
    @story = Story.new(params[:story])
    @story.campaign_id = params[:campaign_id]
    @story.save
    respond_with @story
  end

  def edit
    @story = Story.find(params[:id])
    respond_with @story
  end

  def update
    @story = Story.find(params[:id])
    @story.update_attributes(params[:story])
    respond_with @story
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    respond_with @story do |format|
      format.html { redirect_to campaign_stories_path(@story.campaign) }
    end
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end
