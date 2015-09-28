class CampaignInvitesController < ApplicationController
  before_action :find_campaign

  def new
    @invite = @campaign.invites.build
  end

  def create
    @invite = @campaign.invites.build(invite_params)
    if @invite.save
      flash[:notice] = 'Invitation sent.'
      redirect_to @campaign
    else
      flash[:notice] = 'Invitation sent.'
    end
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def invite_params
    params.require(:campaign_invite).permit(:email)
  end
end
