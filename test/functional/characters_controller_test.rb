require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
 
  def setup
  end
  
  context "A CharactersController" do
    setup do
      @character   = Character.find(:first)
    end

    should_route :get, '/campaigns/1/characters', :action=>:index, :campaign_id=>1
    should_route :get, '/campaigns/1/characters.xml', :action=>:index, :format=>:xml, :campaign_id=>1
    should_route :get, '/characters/1', :action => :show, :id=>1
    should_route :get, '/characters/1.xml', :action => :show, :id=>1, :format=>:xml
    should_route :get, '/campaigns/1/characters/new', :action => :new, :campaign_id=>1
    should_route :get, '/characters/1/edit', :action => :edit, :id=>1
    should_route :post, '/campaigns/1/characters', :action => :create, :campaign_id=>1
    should_route :put, '/characters/1', :action => :update, :id => 1
    should_route :delete, '/characters/1', :action => :destroy, :id => 1

        #INDEX TESTS
    context "on GET to :index" do
      setup do
        get :index, :campaign_id=>@character.campaign
      end
      should_not_set_the_flash
      should_render_template :index
      should_respond_with :success
    end

    context "on GET to :index as xml" do
      setup do
        get :index, :format=>'xml', :campaign_id=>@character.campaign
      end
      should_respond_with_content_type 'application/xml'
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      should_respond_with_xml_for :characters
    end

    #SHOW TESTS
    context "on GET to :show" do
      setup do
        get :show, :id=>@character
      end
      should_assign_to :character
      should_not_set_the_flash
      should_render_template :show
      should_respond_with :success
    end

    context "on GET to :show as xml" do
      setup do
        get :show, :id=>@character, :format=>'xml'
      end
      should_assign_to :character
      should_respond_with_content_type 'application/xml'
      should_not_set_the_flash
      should_render_without_layout
      should_respond_with :success
      should_respond_with_xml_for :character
    end

    #NEW TESTS
    context "on GET to :new" do
      setup do
        get :new, :campaign_id=>@character.campaign
      end
      should_assign_to :character
      should_not_set_the_flash
      should_render_template :new
      should_respond_with :success
      should_render_a_form
    end

    #EDIT TESTS
    context "on GET to :edit" do
      setup do
        get :edit, :id=>@character
      end
      should_assign_to :character
      should_not_set_the_flash
      should_render_template :edit
      should_respond_with :success
      should_render_a_form
    end

    #CREATE TESTS
    context "on POST to :create" do
      setup do
        post :create, :character=>{ :campaign_id=>@character.campaign.id, :name=>'Unknown', :public_description=>'Nothing', :statistics=>'None' }, :campaign_id=>@character.campaign
      end
      should_assign_to :character
      should_set_the_flash_to(/created/i)
      should_redirect_to "character_path(@character)"
    end

    #UPDATE TESTS
    context "on PUT to :update" do
      setup do
        put :update, :character=>{:name=> 'Unknown'}, :id=>@character
      end
      should_assign_to :character
      should_set_the_flash_to(/updated/i)
      should_redirect_to "character_url(@character)"
    end

    #DELETE tests
    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@character
      end
      should_set_the_flash_to(/removed/i)
      should_redirect_to "campaign_url(@character.campaign)"
    end

  end
end 