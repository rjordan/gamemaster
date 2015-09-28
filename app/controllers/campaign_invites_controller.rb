class CampaignInvitesController < ApplicationController
  respond_to :html, :json
  before_action :find_campaign

  def new
    @invite = @campaign.invites.build
    respond_with @invite
  end

  def create
    @invite = @campaign.invites.build(invite_params)
    if @invite.save
      flash[:notice] = 'Invitation sent.'
      respond_with @invite do |format|
        format.html { redirect_to @campaign }
      end
    else
      respond_with @invite
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
