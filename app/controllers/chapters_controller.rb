class ChaptersController < ApplicationController

  def index
    @chapters = Chapter.find(:all)
    respond_to do |format|
      format.html
      format.xml { render :xml => @chapters }
    end
  end
  
  def show
    @chapter = Chapter.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @chapter }
    end
  end
  
  def new
    @chapter = Chapter.new
    @chapter.story = Story.find(params[:story_id])
  end
  
  def edit
    @chapter = Chapter.find(params[:id])
  end
  
  def destroy
    chapter = Chapter.find(params[:id])
    
    chapter.destroy
    flash[:notice] = "The specified chapter has been removed!"
    redirect_to campaign_story_chapters_url(chapter.story.campaign, chapter.story)
  end
  
  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update_attributes(params[:chapter])
    if @chapter.save
      flash[:notice] = "The chapter was updated successfully!"
      redirect_to campaign_story_chapter_url(@chapter.story.campaign, @chapter.story, @chapter) and return
    end
    render :action=>:edit
  end
  
  def create
    @chapter = Chapter.new(params[:chapter])
    @chapter.story_id = params[:story_id]
    if @chapter.save
      flash[:notice] = "The chapter was created successfully!"
      redirect_to campaign_story_chapter_url(@chapter.story.campaign, @chapter.story, @chapter) and return
    end
    render :action=>:new
  end

end