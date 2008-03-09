class CampaignsController < ApplicationController
  # GET /campaigns
  # GET /campaigns.xml
  def index
    @campaigns = Campaign.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @campaigns.to_xml }
    end
  end
  
  # GET /campaigns/1
  # GET /campaigns/1.xml
  def show
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.html #show.html.erb
      format.xml { render :xml => @campaign.to_xml }
    end
  end
  
  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end
  
  # GET /campaigns/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
  end
  
  # PUT /campaigns/1
  # PUT /campaigns/1.xml
  def update
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        flash[:notice] = 'Camapaign was successfully updated.'
        format.html { redirect_to campaign_url(@campaign) }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @campaign.errors.to_xml }
      end
    end
  end
  
  # POST /campaigns
  # POST /campaigns.xml
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.user_id = session[:user_id]
    respond_to do |format|
      if @campaign.save
        flash[:notice] = 'Campaign was successfully created.'
        format.html { redirect_to campaign_url(@campaign) }
        format.xml  { head :created, :location => campaign_url(@campaign) }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @campaign.errors.to_xml }
      end
    end
  end
    
  # DELETE /campaigns/1
  # DELETE /campaigns/1.xml
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    flash[:notice] = "Campaign was removed"

    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.xml  { head :ok }
    end
  end
end