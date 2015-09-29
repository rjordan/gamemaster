require 'rails_helper'

describe PostsController, type: :controller do
  let(:article) { FactoryGirl.create(:post) }
  let(:user) { FactoryGirl.create(:user) }
  before do
    login_as user
  end

  # #INDEX TESTS
  # context "on GET to :index" do
  #   setup do
  #     get :index, :forum_id => @post.forum
  #   end
  #   should_not set_flash
  #   should render_template :index
  #   should respond_with :success
  # end

  # SHOW TESTS
  describe 'on GET to :show' do
    before do
      get :show, id: article
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:post)).to be_instance_of(Post) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:show) }
  end

  # NEW TESTS
  describe 'on GET to :new' do
    before do
      get :new, forum_id: article.forum
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:post)).to be_instance_of(Post) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:new) }
  end

  # CREATE TESTS
  describe 'on POST to :create' do
    before do
      post :create,
           forum_id: article.forum,
           post: FactoryGirl.attributes_for(:post,
                                            forum_id: article.forum_id)
    end
    it { expect(assigns(:post)).to be_instance_of(Post) }
    it { expect(subject).to set_flash.to(/created/i) }
    it { expect(subject).to redirect_to(post_path(assigns(:post))) }
  end

  # EDIT TESTS
  describe 'on GET to :edit' do
    before do
      get :edit, id: article
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:post)).to be_instance_of(Post) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:edit) }
  end

  # UPDATE TESTS
  describe 'on PUT to :update' do
    before do
      put :update, id: article, post: { title: 'A General Forum' }
    end
    it { expect(assigns(:post)).to be_instance_of(Post) }
    it { expect(subject).to set_flash.to(/updated successfully/i) }
    it { expect(subject).to redirect_to(post_path(assigns(:post))) }
  end

  # DELETE tests
  describe 'on DELETE to :destroy' do
    before do
      delete :destroy, id: article
    end
    it { expect(assigns(:post)).to be_instance_of(Post) }
    it { expect(subject).to set_flash.to(/deleted successfully/i) }
    it { expect(subject).to redirect_to(forum_posts_path(assigns(:post).forum)) }
  end
end
