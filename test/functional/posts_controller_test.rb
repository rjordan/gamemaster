require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
  end
  
  context "A PostsController" do
    setup do
      sign_in users(:rjordan)
      @post = Post.find(:first)
    end

    should_route :get, '/forums/1/posts', :action=>:index, :forum_id=>1
    should_route :get, '/forums/1/posts.xml', :action=>:index, :forum_id=>1, :format=>:xml
    should_route :get, '/posts/1', :action => :show, :id=>1
    should_route :get, '/posts/1.xml', :action => :show, :id=>1, :format=>:xml
    should_route :get, '/forums/1/posts/new', :action => :new, :forum_id=>1
    should_route :get, '/posts/1/edit', :action => :edit, :id=>1
    should_route :post, '/forums/1/posts', :action => :create, :forum_id=>1
    should_route :put, '/posts/1', :action => :update, :id => 1
    should_route :delete, '/posts/1', :action => :destroy, :id => 1

    #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :forum_id=>@post.forum
      end
      should_not_set_the_flash
      should_render_template :index
      should_respond_with :success
    end

    # context "on GET to :index as xml" do
      # setup do
        # get :index, :forum_id=>@post.forum, :format=>'xml'
      # end
      # should_respond_with_content_type :xml
      # should_not_set_the_flash
      # should_render_without_layout
      # should_respond_with :success
      # should_respond_with_xml_for :posts
    # end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@post, :forum_id=>@post.forum
      end
      #should_assign_to :post
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    # context "on GET to :show as xml" do
      # setup do
        # get :show, :id=>@post, :forum_id=>@post.forum, :format=>'xml'
      # end
      # should_assign_to :post
      # should_respond_with_content_type :xml
      # should_not_set_the_flash
      # should_render_without_layout
      # should_respond_with :success
      # should_respond_with_xml_for :post
    # end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new, :forum_id=>@post.forum
      end
      #should_assign_to :post
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@post
      end
      #should_assign_to :post
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        @user = User.first
        post :create, :forum_id=>@post.forum.id, :post=>{:user_id=>@user.id, :title=>'A General Forum', :contents=>"Another post!!!" }
#        resource.create.params[:forum_id]=Forum.find(:first)
      end
      #should_assign_to :post
      should_set_the_flash_to(/created/i)
      should_redirect_to("the post view") { post_path( assigns(:post) ) }
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :post=>{:title=>'A General Forum'}, :id=>@post
      end
      #should_assign_to :post
      should_set_the_flash_to(/updated/i)
      should_redirect_to("the post view") { post_path( assigns(:post) ) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@post.id
      end
      should_set_the_flash_to(/successfully removed/i)
      should_redirect_to("the forum posts list") { forum_posts_url(@post.forum) }
    end

  end
end 
