class LocationsController < ApplicationController

  def index
    campaign = Campaign.find(params[:campaign_id])
    @locations = campaign.locations
    respond_to do |format|
      format.html
      format.xml { render :xml => @locations }
    end
  end

  def show
    @location = Location.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @location }
    end
  end

  def new
    campaign = Campaign.find(params[:campaign_id])
    @location = campaign.locations.build
  end
end
