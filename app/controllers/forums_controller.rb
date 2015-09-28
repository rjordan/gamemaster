class ForumsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @forums = Forum.where(public: true, campaign_id: nil).order(:name).all
    if current_user
      # TODO: add private forums the user has
    end
    respond_with @forums
  end

  def show
    @forum = Forum.find(params[:id])
    respond_with @forum
  end

  def new
    @forum = Forum.new
    respond_with @forum
  end

  def edit
    @forum = Forum.find(params[:id])
    respond_with @forum
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    respond_with @forum
  end

  def update
    @forum = Forum.find(params[:id])
    @forum.update_attributes(params[:forum])
    respond_with @forum
  end

  def create
    @forum = Forum.new(params[:forum])
    @forum.user_id = current_user
    @forum.save
    respond_with @forum
  end
end
