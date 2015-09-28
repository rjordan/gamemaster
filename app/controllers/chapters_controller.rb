class ChaptersController < ApplicationController
  before_action :fetch_story

  def index
    @chapters = @story.chapters.all
  end

  def show
    @chapter = @story.chapters.find(params[:id])
  end

  def new
    @chapter = @story.chapters.build
  end

  def edit
    @chapter = @story.chapters.find(params[:id])
  end

  # def sort
  #   chapters = Chapter.find(params[:chapter])
  #   pos = 1
  #   params[:chapter].each do |id|
  #     chapter = chapters.select { |c| c.id=id }.first
  #     chapter.position=pos
  #     chapter.save!
  #     pos+=1
  #   end
  #   render :nothing => true
  # end
  #
  # def destroy
  #   @chapter = Chapter.find(params[:id])
  #   @chapter.destroy
  #   respond_with @chapter do |format|
  #     format.html { redirect_to story_chapters_path(@chapter.story) }
  #   end
  # end
  #
  # def update
  #   @chapter = Chapter.find(params[:id])
  #   @chapter.update_attributes(params[:chapter])
  # end
  #
  # def create
  #   @chapter = Story.find(params[:story_id]).chapters.build(params[:chapter])
  #   @chapter.save
  # end

  protected

  def fetch_story
    @story = Story.find(params[:story_id]) if params[:story_id]
  end
end
