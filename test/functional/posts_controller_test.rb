require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
    @controller = PostsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @post   = Post.find(:first)
  end
  
  context "A PostsController" do

      should_be_restful do |resource|
        resource.parent = :forum
        resource.actions    = [:index, :show, :new, :edit, :update, :destroy, :create]
        resource.formats    = [:html, :xml]
        resource.create.params = { :title=>'A General Forum', :contents=>"Another post!!!"  }
        resource.create.params[:user_id]=User.find(:first)
        resource.create.params[:forum_id]=Forum.find(:first)
        resource.update.params = { :title=>'A General Forum'  }
      end 

  end
end 