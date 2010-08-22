require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
 
  def setup
  end
  
  context "A CharactersController" do
    setup do
      sign_in users(:rjordan)
      @character = Character.find(:first)
    end

    should route(:get, '/campaigns/1/characters').to(:action=>:index, :campaign_id=>1)
    should route(:get, '/campaigns/1/characters.xml').to(:action=>:index, :format=>:xml, :campaign_id=>1)
    should route(:get, '/characters/1').to(:action => :show, :id=>1)
    should route(:get, '/characters/1.xml').to(:action => :show, :id=>1, :format=>:xml)
    should route(:get, '/campaigns/1/characters/new').to(:action => :new, :campaign_id=>1)
    should route(:get, '/characters/1/edit').to(:action => :edit, :id=>1)
    should route(:post, '/campaigns/1/characters').to(:action => :create, :campaign_id=>1)
    should route(:put, '/characters/1').to(:action => :update, :id => 1)
    should route(:delete, '/characters/1').to(:action => :destroy, :id => 1)

        #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :campaign_id=>@character.campaign
      end
      should_not set_the_flash
      should render_template :index
      should respond_with :success
    end

    # context "on GET to :index as xml" do
      # setup do
        # get :index, :format=>'xml', :campaign_id=>@character.campaign
      # end
      # should_respond_with_content_type :xml
      # should_not_set_the_flash
      # should_render_without_layout
      # should_respond_with :success
      # should_respond_with_xml_for :characters
    # end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@character
      end
      #should_assign_to :character
      should_not set_the_flash
      should render_template :show
      should respond_with :success
    end

    # context "on GET to :show as xml" do
      # setup do
        # get :show, :id=>@character, :format=>'xml'
      # end
      # should_assign_to :character
      # should_respond_with_content_type :xml
      # should_not_set_the_flash
      # should_render_without_layout
      # should_respond_with :success
      # should_respond_with_xml_for :character
    # end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new, :campaign_id=>@character.campaign
      end
      #should_assign_to :character
      should_not set_the_flash
      should render_template :new
      should respond_with :success
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@character
      end
      #should_assign_to :character
      should_not set_the_flash
      should render_template :edit
      should respond_with :success
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :character=>{ :campaign_id=>@character.campaign.id, :name=>'Unknown', :public_description=>'Nothing', :statistics=>'None' }, :campaign_id=>@character.campaign
      end
      #should_assign_to :character
      should set_the_flash.to(/created/i)
      should redirect_to("the character view") { character_url(assigns(:character)) }
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :character=>{:name=> 'Unknown'}, :id=>@character
      end
      #should_assign_to :character
      should set_the_flash.to(/updated/i)
      should redirect_to("the character view") { character_url(@character) }
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@character
      end
      should set_the_flash.to(/successfully removed/i)
      should redirect_to("the campaign view") { campaign_url(@character.campaign) }
    end

  end
end 
