class CampaignResourcesController < ApplicationController
  before_action :find_campaign, only: [:index, :new, :create]
  before_action :find_resource, only: [:show, :edit, :update]

  def index
    @resources = @campaign.resources
  end

  def show
  end

  def new
    @resource = @campaign.resources.build
  end

  def edit
  end

  def create
    @resource = @campaign.resources.create(campaign_resource_params)
  end

  def update
    @resource.update_attributes(campaign_resource_params)
  end

  def destroy
    @resource = CampaignResource.find_by(id: params[:id])
    @resource.destroy if @resource
    redirect_to campaign_path(@resource.campaign)
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def find_resource
    @resource = CampaignResource.find(params[:id])
  end

  def campaign_resource_params
    params.require(:campaign_resource).permit(:name, :campaign_id, :resource_type,
                                              :public, :public_description, :private_description)
  end
end
