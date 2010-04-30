class PostsController < ApplicationController
  respond_to :html, :xml, :json
 
  def index
    @forum = Forum.find(params[:forum_id], :include=>:posts)
    @posts = @forum.posts
    respond_with @posts
  end
  
  def show
    @post = Post.find(params[:id])
    respond_with @post
  end
  
  def new
    @post = Post.new
    @post.forum = Forum.find(params[:forum_id])
    respond_with @post
  end
  
  def edit
    @post = Post.find(params[:id])
    respond_with @post
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with @post do |format|
      format.html { redirect_to forum_posts_path(@post.forum) }
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    @post.save
    respond_with @post
  end
  
  def create
    @post = Post.new(params[:post])
    @post.forum = Forum.find(params[:forum_id])
    @post.user =  current_user
    @post.save
    respond_with @post
  end
   
end
