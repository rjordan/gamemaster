class CharactersController < ApplicationController
  before_action :fetch_campaign

  def index
    @characters = @campaign.characters
  end

  def show
    @character = @campaign.characters.find(params[:id])
  end

  def new
    @character = @campaign.characters.build
  end

  def edit
    @character = @campaign.characters.find(params[:id])
  end

  def destroy
    @character = @campaign.characters.find(params[:id])
    @character.destroy
    respond_to do |format|
      format.html { redirect_to campaign_path(@character.campaign) }
    end
  end

  def update
    @character = @campaign.characters.find(params[:id])
    @character.update_attributes(params[:character])
  end

  def create
    @character = @campaign.characters.build(params[:character])
    @character.save
  end

  protected

  def fetch_campaign
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
  end
end
