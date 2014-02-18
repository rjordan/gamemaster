class CharactersController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @characters = Character.all
    respond_with @characters
  end

  def show
    @character = Character.find(params[:id])
    respond_with @character
  end

  def new
    @character = Campaign.find(params[:campaign_id]).nonplayer_characters.build
    respond_with @character
  end

  def edit
    @character = Character.find(params[:id])
    respond_with @character
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    respond_with @character do |format|
      format.html { redirect_to campaign_path(@character.campaign) }
    end
  end

  def update
    @character = Character.find(params[:id])
    @character.update_attributes(params[:character])
    respond_with @character
  end

  def create
    @character = Character.new(params[:character])
    @character.campaign = Campaign.find(params[:campaign_id])
    @character.save
    respond_with @character
  end

end
