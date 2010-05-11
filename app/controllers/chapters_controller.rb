class ChaptersController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @chapters = Chapter.all
    respond_with @chapters
  end
  
  def show
    @chapter = Chapter.find(params[:id])
    respond_with @chapter
  end
  
  def new
    @chapter = Story.find(params[:story_id]).chapters.build
    respond_with @chapter
  end
  
  def edit
    @chapter = Chapter.find(params[:id])
    respond_with @chapter
  end
  
  def sort
    chapters = Chapter.find(params[:chapter])
    pos = 1
    params[:chapter].each do |id|
      chapter = chapters.select { |c| c.id=id }.first
      chapter.position=pos
      chapter.save!
      pos+=1
    end
    render :nothing=>true
  end
  
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    respond_with @chapter do |format|
      format.html { redirect_to story_chapters_path(@chapter.story) }
    end
  end
  
  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update_attributes(params[:chapter])
    respond_with @chapter
  end
  
  def create
    @chapter = Story.find(params[:story_id]).chapters.build(params[:chapter])
    @chapter.save
    respond_with @chapter 
  end

end
