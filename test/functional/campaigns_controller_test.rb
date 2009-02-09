require 'test_helper'

class CampaignsControllerTest < ActionController::TestCase
  
  def setup
    @controller = CampaignsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @campaign   = Campaign.find(:first)
  end
  
  context "A CampaignsController" do

#    context "when a user is logged in" do
      setup do
      end
      
      should_be_restful do |resource|
        resource.actions    = [:index, :show, :new, :edit, :update, :destroy, :create]
        resource.formats    = [:html, :xml]
        resource.create.params = { :name=>'Unknown', :max_players=>5, :system_id=>1  }
        resource.update.params = { :name=> 'Unknown' }
      end 
#    end

#    context "when a user is NOT logged in" do
#      setup do
#      end
#      should_be_restful do |resource|
#        resource.actions = [:index, :show]
#        resource.denied.actions    = [:new, :edit, :update, :destroy, :create]
#        resource.formats    = [:html, :xml]
#        #resource.create.params = { :name=>'Unknown'  }
#        resource.update.params = { :name=> 'Unknown' }
#      end 
#    end

  end
end 