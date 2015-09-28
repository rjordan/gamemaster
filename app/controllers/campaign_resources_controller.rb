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
    @resource = Campaign.find(params[:campaign_id]).resources.create(campaign_resource_params)
    respond_with @resource
  end

  def update
    @resource = CampaignResource.find(params[:id])
    @resource.update_attributes(campaign_resource_params)
    respond_with @resource
  end

  def destroy
    @resource = CampaignResource.find(params[:id])
    @resource.destroy
    respond_with @resource do |format|
      format.html do
        redirect_to campaign_path(@resource.campaign)
      end
    end
  end

  private

  def campaign_resource_params
    params.require(:campaign_resource).permit(:name, :campaign_id, :resource_type,
                                              :public, :public_description, :private_description)
  end
end
