require 'test_helper'

class ChaptersControllerTest < ActionController::TestCase
 
  def setup
    @controller = ChaptersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @chapter   = Chapter.find(:first)
  end
  
  context "A ChaptersController" do

#    context "when a user is logged in" do
      
      should_be_restful do |resource|
        resource.parent = :story
        resource.actions    = [:index, :show, :new, :edit, :update, :destroy, :create]
        resource.formats    = [:html, :xml]
        resource.create.params = { :name=>'Unknown', :public_description=>'Nothing'}
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