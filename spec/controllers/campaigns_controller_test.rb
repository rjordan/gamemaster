require 'test_helper'

class CampaignsControllerTest < ActionController::TestCase
  
  def setup
  end
  
  context "A CampaignsController" do
    setup do
      sign_in @user = users(:rjordan)
      @campaign   = Campaign.first
    end

    should route(:get, '/campaigns').to(:action => :index)
    should route(:get, '/campaigns.xml').to(:action => :index, :format=>:xml)
    should route(:get, '/campaigns/1').to(:action => :show, :id=>1)
    should route(:get, '/campaigns/1.xml').to(:action => :show, :id=>1, :format=>:xml)
    should route(:get, '/campaigns/new').to(:action => :new)
    should route(:get, '/campaigns/1/edit').to(:action => :edit, :id=>1)
    should route(:post, '/campaigns').to(:action => :create)
    should route(:put, '/campaigns/1').to(:action => :update, :id => 1)
    should route(:delete, '/campaigns/1').to(:action => :destroy, :id => 1)

    context "on GET to :index" do
      setup do
        get :index
      end
      should_not set_the_flash
      should render_template :index
      should respond_with :success
    end

    context "on GET to :show" do
      setup do
        get :show, :id=>@campaign
      end
      #should_assign_to :campaign
      should_not set_the_flash
      should render_template :show
      should respond_with :success
      #check for forums
    end

    context "on GET to :new" do
      setup do
        get :new
      end
      #should_assign_to :campaign
      should_not set_the_flash
      should render_template :new
      should respond_with :success
    end

    context "on GET to :edit" do
      setup do
        get :edit, :id=>@campaign
      end
      #should_assign_to :campaign
      should_not set_the_flash
      should render_template :edit
      should respond_with :success
    end

    context "on POST to :create" do
      setup do
        post :create, :campaign=>{:name=>'Unknown', :max_players=>5, :system_id=>1, :description=>'Test Campaign', :user_id=>@user.id}
      end
      #should_assign_to :campaign
      should set_the_flash.to(/created/i)
      should redirect_to("the campaign view") { campaign_url(assigns(:campaign)) }
    end

    context "on PUT to :update" do
      setup do
        put :update, :id=>@campaign, :campaign=>{:name=>'Unknown'} 
      end
      #should_assign_to :campaign
      should set_the_flash.to(/updated/i)
      should redirect_to("the campaign view") { campaign_url(@campaign) }
    end

    context "on DELETE to :destroy" do
      setup do
        delete :destroy, :id=>@campaign
      end
      should set_the_flash.to(/successfully destroyed/i)
      should redirect_to("the campaigns list") { campaigns_url }
    end

  end
end 
