class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.where(:public => true).order('name')
  end

  def show
    @campaign = Campaign.includes(:resources, :characters).find(params[:id])
    # @npcs = @campaign.nonplayer_characters
    @invite = @campaign.invites.build
  end

  def new
    @campaign = Campaign.new()
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    validate_user @campaign
    @campaign.save
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes(params[:campaign])
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
  end
end
