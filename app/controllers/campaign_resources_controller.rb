class CampaignResourcesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @resources = Campaign.find(params[:campaign_id]).resources
    respond_with @resources
  end

  def show
    @resource = CampaignResource.find(params[:id])
    respond_with @resource
  end

  def new
    @resource = Campaign.find(params[:campaign_id]).resources.build
    respond_with @resource
  end

  def edit
    @resource = CampaignResource.find(params[:id])
    respond_with @resource
  end

  def create
    @resource = Campaign.find(params[:campaign_id]).resources.create(params[:campaign_resource])
    respond_with @resource
  end

  def update
    @resource = CampaignResource.find(params[:id])
    @resource.update_attributes(params[:campaign_resource])
    respond_with @resource
  end

  def destroy
    @resource = CampaignResource.find(params[:id])
    @resource.destroy
    respond_with @resource do |format|
      format.html { 
        redirect_to campaign_path(@resource.campaign) 
       }
    end
  end
end
