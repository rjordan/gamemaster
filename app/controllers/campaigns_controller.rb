class CampaignsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @campaigns = Campaign.where(:public=>true).order('name').all
    respond_with @campaigns 
  end
  
  def show
    @campaign = Campaign.includes(:resources).find(params[:id]) #, :include=>[:players, :stories, :player_characters, :nonplayer_characters])
    @npcs = @campaign.nonplayer_characters
    @invite = @campaign.invites.build
    respond_with @campaign
  end
  
  def new
    respond_with @campaign = Campaign.new(:user=>current_user)
  end
  
  def edit
    respond_with @campaign = Campaign.find(params[:id])
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    respond_with @campaign
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes(params[:campaign])
    respond_with @campaign
  end
  
  def create
    @campaign = Campaign.new(params[:campaign])
    validate_user @campaign
    @campaign.save
    respond_with @campaign
  end
   
end
