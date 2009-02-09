require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
 
  def setup
    @controller = CharactersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @character   = Character.find(:first)
  end
  
  context "A CharactersController" do

#    context "when a user is logged in" do
      
      should_be_restful do |resource|
        resource.parent = :campaign
        resource.actions    = [:index, :show, :new, :edit, :update, :destroy, :create]
        resource.formats    = [:html, :xml]
        resource.create.params = { :name=>'Unknown', :public_description=>'Nothing', :statistics=>'None'}
        resource.update.params = { :name=> 'Unknown' }
        resource.destroy.redirect = "campaign_url(@character.campaign)"
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