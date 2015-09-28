class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]

  def index
    @forum = Forum.find(params[:forum_id], include: :posts)
    @posts = @forum.posts
  end

  def show
  end

  def new
    @post = Post.new(forum: Forum.find(params[:forum_id]), user: current_user)
  end

  def create
    @post = Post.new(params[:post])
    validate_user @post
    @post.save
  end

  def edit
  end

  def update
    @post.update_attributes(params[:post])
    validate_user @post
    @post.save
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy if @post
    redirect_to forum_posts_path(@post.forum)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
