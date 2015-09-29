class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]
  before_action :find_forum, only: [:index, :new, :create]

  def index
    @posts = Post.where(forum: @forum).order(:created_at)
  end

  def show
  end

  def new
    @post = @forum.posts.build(user: current_user)
  end

  def create
    @post = @forum.posts.build(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Post created.'
      redirect_to(post_path(@post))
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    if @post.save
      flash[:notice] = 'Post updated successfully.'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy if @post
    flash[:notice] = 'Post deleted successfully.'
    redirect_to forum_posts_path(@post.forum)
  end

  private

  def post_params
    params.require(:post).permit(:title, :contents)
  end

  def find_forum
    @forum = Forum.find(params[:forum_id])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
