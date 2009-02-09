require 'test_helper'

class ForumsControllerTest < ActionController::TestCase
  
  def setup
    @controller = ForumsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @forum   = Forum.find(:first)
  end
  
  context "A ForumsController" do

      should_be_restful do |resource|
        resource.actions    = [:index, :show, :new, :edit, :update, :destroy, :create]
        resource.formats    = [:html, :xml]
        resource.create.params = { :name=>'A General Forum'  }
        resource.update.params = { :name=>'A General Forum'  }
      end 

  end
end 