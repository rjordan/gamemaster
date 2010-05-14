class CampaignInvitesController < ApplicationController
  respond_to :html, :xml, :json

#  def index
#    @invites = Campaign.find(params[:campaign_id]).invites
#    respond_with @invites
#  end

  def new
    @invite = Campaign.find(params[:campaign_id]).invites.build
    respond_with @invite
  end

  def create
    @invite = Campaign.find(params[:campaign_id]).invites.create(params[:campaign_invite])
    respond_with @invite do |format|
      format.html { redirect_to campaign_path(@invite.campaign) }
    end
  end

#  def destroy
#    @invite = CampaignInvite.find(params[:id])
#    @invite.destroy
#    respond_with @invite do |format|
#      format.html { 
#        redirect_to campaign_path(@invite.campaign) 
#       }
#    end
#  end
end
