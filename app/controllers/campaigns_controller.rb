class CampaignsController < ApplicationController
  
  def index
    @campaigns = Campaign.find(:all, :conditions=>{:public=>true},:order=>'name')
    respond_to do |format|
      format.html
      format.xml { render :xml => @campaigns }
    end
  end
  
  def show
    @campaign = Campaign.find(params[:id], :include=>[:players, :stories, :player_characters, :nonplayer_characters])
    @npcs = @campaign.nonplayer_characters.find(:all, :order=>:name)
    respond_to do |format|
      format.html
      format.xml { render :xml => @campaign }
    end
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end
  
  def destroy
    campaign = Campaign.find(params[:id])
    campaign.destroy
    flash[:notice] = "The specified campaign has been removed!"
    redirect_to campaigns_path
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes(params[:campaign])
    if @campaign.save
      flash[:notice] = "The campaign was updated successfully!"
      redirect_to campaign_path(@campaign) and return
    end
    render :action=>:edit
  end
  
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.user_id = User.find(:first).id
    if @campaign.save
      flash[:notice] = "The campaign was created successfully!"
      redirect_to campaign_path(@campaign) and return
    end
    render :action=>:new
  end
   
end