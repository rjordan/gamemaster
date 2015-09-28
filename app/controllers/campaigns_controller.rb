class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update]

  def index
    @campaigns = Campaign.where(public: true).order('name')
  end

  def show
    @invite = @campaign.invites.build
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    validate_user @campaign
    @campaign.save
  end

  def edit
  end

  def update
    @campaign.update_attributes(campaign_params)
    redirect_to @campaign
  end

  def destroy
    @campaign = Campaign.find_by(id: params[:id])
    @campaign.destroy if @campaign
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :system_id, :max_players, :description)
  end
end
