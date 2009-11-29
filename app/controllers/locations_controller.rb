class LocationsController < ApplicationController

  def index
    campaign = Campaign.find(params[:campaign_id])
    @locations = campaign.locations
    respond_to do |format|
      format.html
      format.xml { render :xml => @locations }
    end
  end
end
