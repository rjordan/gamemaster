require 'rails_helper'

describe PostsController, type: :controller do
  before do
    @post = create(:post)
  end

  # #INDEX TESTS
  # context "on GET to :index" do
  #   setup do
  #     get :index, :forum_id => @post.forum
  #   end
  #   should_not set_flash
  #   should render_template :index
  #   should respond_with :success
  # end
  #
  # #SHOW TESTS
  # context "on GET to :show" do
  #   setup do
  #     get :show, :id => @post, :forum_id => @post.forum
  #   end
  #   #should_assign_to :post
  #   should_not set_flash
  #   should render_template :show
  #   should respond_with :success
  # end
  #
  # #NEW TESTS
  # context "on GET to :new" do
  #   setup do
  #     get :new, :forum_id => @post.forum
  #   end
  #   #should_assign_to :post
  #   should_not set_flash
  #   should render_template :new
  #   should respond_with :success
  # end
  #
  # #EDIT TESTS
  # context "on GET to :edit" do
  #   setup do
  #     get :edit, :id => @post
  #   end
  #   #should_assign_to :post
  #   should_not set_flash
  #   should render_template :edit
  #   should respond_with :success
  # end
  #
  # #CREATE TESTS
  # context "on POST to :create" do
  #   setup do
  #     post :create, :post => { :user_id => @user.id, :forum_id => @post.forum.id, :title => 'A General Forum', :contents => "Another post!!!" }
  #   end
  #   #should_assign_to :post
  #   should set_flash.to(/created/i)
  #   should redirect_to("the post view") { post_path(assigns(:post)) }
  # end
  #
  # #UPDATE TESTS
  # context "on PUT to :update" do
  #   setup do
  #     put :update, :post => { :title => 'A General Forum' }, :id => @post
  #   end
  #   #should_assign_to :post
  #   should set_flash.to(/updated/i)
  #   should redirect_to("the post view") { post_path(assigns(:post)) }
  # end
  #
  # #DELETE tests
  # context "on DELETE to :destroy" do
  #   setup do
  #     delete :destroy, :id => @post.id
  #   end
  #   should set_flash.to(/successfully destroyed/i)
  #   should redirect_to("the forum posts list") { forum_posts_url(@post.forum) }
  # end
end
