require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
  end
  
  context "A PostsController" do
    setup do
      sign_in @user = users(:rjordan)
      @post = Post.find(:first)
    end

    should route(:get, '/forums/1/posts').to(:action=>:index, :forum_id=>1)
    should route(:get, '/forums/1/posts.xml').to(:action=>:index, :forum_id=>1, :format=>:xml)
    should route(:get, '/posts/1').to(:action => :show, :id=>1)
    should route(:get, '/posts/1.xml').to(:action => :show, :id=>1, :format=>:xml)
    should route(:get, '/forums/1/posts/new').to(:action => :new, :forum_id=>1)
    should route(:get, '/posts/1/edit').to(:action => :edit, :id=>1)
    should route(:post, '/forums/1/posts').to(:action => :create, :forum_id=>1)
    should route(:put, '/posts/1').to(:action => :update, :id => 1)
    should route(:delete, '/posts/1').to(:action => :destroy, :id => 1)

    #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :forum_id=>@post.forum
      end
      should_not set_the_flash
      should render_template :index
      should respond_with :success
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
      should_not set_the_flash
      should render_template :show
      should respond_with :success
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
      should_not set_the_flash
      should render_template :new
      should respond_with :success
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@post
      end
      #should_assign_to :post
      should_not set_the_flash
      should render_template :edit
      should respond_with :success
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :post=>{:user_id=>@user.id, :forum_id=>@post.forum.id, :title=>'A General Forum', :contents=>"Another post!!!" }
      end
      #should_assign_to :post
      should set_the_flash.to(/created/i)
      should redirect_to("the post view") { post_path( assigns(:post) ) }
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :post=>{:title=>'A General Forum'}, :id=>@post
      end
      #should_assign_to :post
      should set_the_flash.to(/updated/i)
      should redirect_to("the post view") { post_path( assigns(:post) ) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@post.id
      end
      should set_the_flash.to(/successfully removed/i)
      should redirect_to("the forum posts list") { forum_posts_url(@post.forum) }
    end

  end
end 
