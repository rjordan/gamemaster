require 'test_helper'

class ChaptersControllerTest < ActionController::TestCase

  def setup
  end

  context "A ChaptersController" do
    setup do
      sign_in users(:rjordan)
      @chapter = Chapter.first
      session[:user_id] = User.first.id
    end

    #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :story_id => @chapter.story
      end
      should_not set_the_flash
      should render_template :index
      should respond_with :success
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
        get :show, :id => @chapter
      end
      #should_assign_to :chapter
      should_not set_the_flash
      should render_template :show
      should respond_with :success
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
        get :new, :story_id => @chapter.story
      end
      #should_assign_to :chapter
      should_not set_the_flash
      should render_template :new
      should respond_with :success
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id => @chapter
      end
      #should_assign_to :chapter
      should_not set_the_flash
      should render_template :edit
      should respond_with :success
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :chapter => { :story_id => @chapter.story.id,
                                    :name => 'Unknown', :public_description => 'test' },
             :story_id => @chapter.story.id
      end
      #should_assign_to :chapter
      should set_the_flash.to(/created/i)
      should redirect_to("the chapter view") { chapter_url(assigns(:chapter)) }
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :chapter => { :name => 'Unknown' }, :id => @chapter
      end
      #should_assign_to :chapter
      should set_the_flash.to(/updated/i)
      should redirect_to("the chapter view") { chapter_url(@chapter) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id => @chapter
      end
      should set_the_flash.to(/successfully destroyed/i)
      should redirect_to("the chapters list for a story") { story_chapters_url(@chapter.story) }
    end

  end
end 
