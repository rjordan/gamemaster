require 'spec_helper'

describe ForumsController do
  before do
    @forum = create(:forum)
  end

  #   #INDEX TESTS
  #   context "on GET to :index" do
  #     setup do
  #       get :index
  #     end
  #     #should_assign_to :forums
  #     should_not set_the_flash
  #     should render_template :index
  #     should respond_with :success
  #   end
  #
  #   #SHOW TESTS
  #   context "on GET to :show" do
  #     setup do
  #       get :show, :id => @forum
  #     end
  #     #should_assign_to :forum
  #     should_not set_the_flash
  #     should render_template :show
  #     should respond_with :success
  #   end
  #
  #   #NEW TESTS
  #   context "on GET to :new" do
  #     setup do
  #       get :new
  #     end
  #     #should_assign_to :forum
  #     should_not set_the_flash
  #     should render_template :new
  #     should respond_with :success
  #   end
  #
  #   #EDIT TESTS
  #   context "on GET to :edit" do
  #     setup do
  #       get :edit, :id => @forum
  #     end
  #     #should_assign_to :forum
  #     should_not set_the_flash
  #     should render_template :edit
  #     should respond_with :success
  #   end
  #
  #   #TODO Implement
  #   #CREATE TESTS
  #   #    context "on POST to :create" do
  #   #      setup do
  #   #        post :create, :forum=>{:name=>'A General Forum'}
  #   #      end
  #   #      should_assign_to :forum
  #   #      should_set_the_flash_to(/created/i)
  #   #      should_redirect_to("the forum view") { forum_url( assigns(:forum) ) }
  #   #    end
  #
  #   #UPDATE TESTS
  #   context "on PUT to :update" do
  #     setup do
  #       put :update, :forum => { :name => 'A General Forum' }, :id => @forum
  #     end
  #     #should_assign_to :forum
  #     should set_the_flash.to(/updated/i)
  #     should redirect_to("the forum view") { forum_url(assigns(:forum)) }
  #   end
  #
  #   #DELETE tests
  #   context "on DELETE to :destroy" do
  #     setup do
  #       delete :destroy, :id => @forum
  #     end
  #     should set_the_flash.to(/successfully destroyed/i)
  #     should redirect_to("the forums list") { forums_url }
  #   end


end
