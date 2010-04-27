require File.dirname(__FILE__) + '/../test_helper'

class ChaptersControllerTest < ActionController::TestCase
 
  def setup
  end
  
  context "A ChaptersController" do
    setup do
      @chapter = Chapter.first
      session[:user_id] = User.first.id
    end

    should_route :get, '/stories/1/chapters', :action => :index, :story_id=>1
    should_route :get, '/stories/1/chapters.xml', :action => :index, :story_id=>1, :format=>:xml
    should_route :get, '/chapters/1', :action => :show, :id=>1
    should_route :get, '/chapters/1.xml', :action => :show, :id=>1, :format=>:xml
    should_route :get, '/stories/1/chapters/new', :action => :new, :story_id=>1
    should_route :get, '/chapters/1/edit', :action => :edit, :id=>1
    should_route :post, '/stories/1/chapters', :action => :create, :story_id=>1
    should_route :put, '/chapters/1', :action => :update, :id => "1"
    should_route :delete, '/chapters/1', :action => :destroy, :id => 1

    #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :story_id=>@chapter.story
      end
      should_not_set_the_flash
      should_render_template :index
      should_respond_with :success
    end

    # context "on GET to :index as xml" do
      # setup do
        # get :index, :format=>'xml', :story_id=>@chapter.story
      # end
      # should_respond_with_content_type :xml
      # should_not_set_the_flash
      # should_render_without_layout
      # should_respond_with :success
      # should_respond_with_xml_for :chapters
    # end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@chapter
      end
      #should_assign_to :chapter
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    # context "on GET to :show as xml" do
      # setup do
        # get :show, :id=>@chapter, :format=>'xml'
      # end
      # should_assign_to :chapter
      # should_respond_with_content_type :xml
      # should_not_set_the_flash
      # should_render_without_layout
      # should_respond_with :success
      # should_respond_with_xml_for :chapter
    # end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new, :story_id=>@chapter.story
      end
      #should_assign_to :chapter
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@chapter
      end
      #should_assign_to :chapter
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :chapter=>{:story_id=>@chapter.story.id,
          :name=>'Unknown', :public_description=>'test' },
          :story_id=>@chapter.story.id
      end
      #should_assign_to :chapter
      should_set_the_flash_to(/created/i)
      should_redirect_to("the chapter view") { chapter_url(assigns(:chapter)) }
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :chapter=>{:name=>'Unknown'}, :id=>@chapter
      end
      #should_assign_to :chapter
      should_set_the_flash_to(/updated/i)
      should_redirect_to("the chapter view") { chapter_url(@chapter) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@chapter
      end
      should_set_the_flash_to(/removed/i)
      should_redirect_to("the chapters list for a story") { story_chapters_url(@chapter.story) }
    end

  end
end 