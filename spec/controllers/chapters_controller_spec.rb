require 'rails_helper'

describe ChaptersController, type: :controller do
  let(:chapter) { FactoryGirl.create(:chapter) }

  describe '#index' do
    before do
      get :index, story_id: chapter.story
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:chapters)).to respond_to(:each) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:index) }
  end

  describe '#show' do
    before do
      get :show, id: chapter.id, story_id: chapter.story
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:chapter)).to be_an_instance_of(Chapter) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:show) }
  end

  describe '#new' do
    before do
      get :new, story_id: chapter.story
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:chapter)).to be_an_instance_of(Chapter) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:new) }
  end

  #   context "on POST to :create" do
  #     setup do
  #       post :create, :chapter => { :story_id => @chapter.story.id,
  #                                   :name => 'Unknown', :public_description => 'test' },
  #            :story_id => @chapter.story.id
  #     end
  #     #should_assign_to :chapter
  #     should set_flash.to(/created/i)
  #     should redirect_to("the chapter view") { chapter_url(assigns(:chapter)) }
  #   end

  describe '#edit' do
    before do
      get :edit, id: chapter, story_id: chapter.story
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:chapter)).to be_an_instance_of(Chapter) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:edit) }
  end

  #   context "on PUT to :update" do
  #     setup do
  #       put :update, :chapter => { :name => 'Unknown' }, :id => @chapter
  #     end
  #     #should_assign_to :chapter
  #     should set_flash.to(/updated/i)
  #     should redirect_to("the chapter view") { chapter_url(@chapter) }
  #   end

  #   context "on DELETE to :destroy" do
  #     setup do
  #       delete :destroy, :id => @chapter
  #     end
  #     should set_flash.to(/successfully destroyed/i)
  #     should redirect_to("the chapters list for a story") { story_chapters_url(@chapter.story) }
  #   end
end
