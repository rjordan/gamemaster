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

  def edit
    @location = Location.find(params[:id])
  end

  def create
    campaign = Campaign.find(params[:campaign_id])
    @location = campaign.locations.build(params[:location])
    if @location.save
      flash[:notice] = "The location was created successfully!"
      redirect_to location_path(@location) and return
    end
    render :action=>:new
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:character])
      flash[:notice] = "The location was updated successfully!"
      redirect_to location_path(@location) and return
    end
    render :action=>:edit
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    flash[:notice] = "The specified location has been removed!"
    redirect_to campaign_path(location.campaign)
  end
end
