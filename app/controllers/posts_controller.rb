class PostsController < ApplicationController
  uses_tiny_mce(:options=>{:theme => 'advanced',
                           :theme_advanced_toolbar_location => "top",
                           #:theme_advanced_resizing => true,
                           #:theme_advanced_resize_horizontal => true,                           
                           :theme_advanced_buttons1 => %w{formatselect fontselect fontsizeselect bold italic underline strikethrough separator indent outdent separator bullist numlist separator link unlink image undo redo},
                           :theme_advanced_buttons2 => [],
                           :theme_advanced_buttons3 => [],
                           :plugins => %w{contextmenu paste}})  
  
  def index
    @forum = Forum.find(params[:forum_id], :include=>:posts)
    @posts = @forum.posts
    respond_to do |format|
      format.html
      format.xml { render :xml => @posts }
    end
  end
  
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end
  
  def new
    @post = Post.new
    @post.forum = Forum.find(params[:forum_id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "The specified post has been removed!"
    redirect_to forum_posts_path(post.forum)
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    if @post.save
      flash[:notice] = "The post was updated successfully!"
      redirect_to post_path(@post) and return
    end
    render :action=>:edit
  end
  
  def create
    @post = Post.new(params[:post])
    @post.forum = Forum.find(params[:forum_id])
    @post.user =  current_user
    if @post.save
      flash[:notice] = "The post was created successfully!"
      redirect_to post_path(@post) and return
    end
    render :action=>:new
  end
   
end