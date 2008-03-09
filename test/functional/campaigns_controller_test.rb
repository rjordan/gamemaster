
require File.dirname(__FILE__) + '/../test_helper'

class CampaignsControllerTest < Test::Unit::TestCase
  
  def setup
    @controller = CampaignsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @campaign       = Campaign.find(:first)
  end
  
  context "when logged in" do
    setup do
    end
    should_be_restful do |resource|
      resource.actions    = [:index, :show, :new, :edit, :update, :destroy] #:create
      resource.formats    = [:html, :xml]
      #resource.create.params = {  :name=>'Unknown'  }
      resource.update.params = { :name=> 'Unknown' }
    end 
  end
end 