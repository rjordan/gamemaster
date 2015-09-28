class StoriesController < ApplicationController
  before_action :find_campaign

  def index
    @stories = @campaign.stories
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = @campaign.stories.build
  end

  def create
    @story = @campaign.stories.build(params[:story])
    @story.save
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update_attributes(params[:story])
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to campaign_stories_path(@story.campaign)
  end

  private

  def story_params
    params.require(:story).permit(:name, :public_description, :private_description)
  end

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
