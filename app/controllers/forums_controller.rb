class ForumsController < ApplicationController
  before_action :find_forum, only: [:show, :edit, :update]

  def index
    @forums = Forum.where(public: true, campaign_id: nil).order(:name).all
    # TODO: add private forums the user has
  end

  def show
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(params[:forum])
    @forum.user_id = current_user
    @forum.save
  end

  def edit
  end

  def update
    @forum.update_attributes(params[:forum])
  end

  def destroy
    @forum = Forum.find_by(id: params[:id])
    @forum.destroy if @forum
  end

  private

  def find_forum
    @forum = Forum.find(params[:id])
  end
end
