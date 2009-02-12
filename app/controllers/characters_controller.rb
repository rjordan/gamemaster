class CharactersController < ApplicationController

  def index
    @characters = Character.find(:all)
    respond_to do |format|
      format.html
      format.xml { render :xml => @characters }
    end
  end
  
  def show
    @character = Character.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @character }
    end
  end
  
  def new
    @character = Character.new
    @character.campaign = Campaign.find(params[:campaign_id])
  end
  
  def edit
    @character = Character.find(params[:id])
  end
  
  def destroy
    character = Character.find(params[:id])
    
    character.destroy
    flash[:notice] = "The specified character has been removed!"
    redirect_to campaign_path(character.campaign)
  end
  
  def update
    @character = Character.find(params[:id])
    @character.update_attributes(params[:character])
    if @character.save
      flash[:notice] = "The character was updated successfully!"
      redirect_to character_path(@character) and return
    end
    render :action=>:edit
  end
  
  def create
    @character = Character.new(params[:character])
    @character.campaign = Campaign.find(params[:campaign_id])
    if @character.save
      flash[:notice] = "The character was created successfully!"
      redirect_to character_path(@character) and return
    end
    render :action=>:new
  end

end