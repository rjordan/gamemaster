require 'spec_helper'

describe ChaptersController do
  before do
    @chapter = create(:chapter)
  end

  describe '#index' do
    before do
      get :index, :story_id => @chapter.story
    end
    it { expect(assigns(:chapters)).to_not be_nil }
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:index) }
    it { expect(response.status).to eq(200) }
  end

  describe '#show' do
    before do
      get :show, :id => @chapter, :story_id => @chapter.story
    end
    it { expect(assigns(:chapter)).to be_an_instance_of(Chapter) }
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:show) }
    it { expect(response.status).to eq(200) }
  end

  describe '#new' do
    before do
      get :new, :story_id => @chapter.story
    end
    it { expect(assigns(:chapter)).to be_an_instance_of(Chapter) }
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:new) }
    it { expect(response.status).to eq(200) }
  end

  #   context "on POST to :create" do
  #     setup do
  #       post :create, :chapter => { :story_id => @chapter.story.id,
  #                                   :name => 'Unknown', :public_description => 'test' },
  #            :story_id => @chapter.story.id
  #     end
  #     #should_assign_to :chapter
  #     should set_the_flash.to(/created/i)
  #     should redirect_to("the chapter view") { chapter_url(assigns(:chapter)) }
  #   end

  describe '#edit' do
    before do
      get :edit, :id => @chapter, :story_id => @chapter.story
    end
    it { expect(assigns(:chapter)).to be_an_instance_of(Chapter) }
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:edit) }
    it { expect(response.status).to eq(200) }
  end

  #   context "on PUT to :update" do
  #     setup do
  #       put :update, :chapter => { :name => 'Unknown' }, :id => @chapter
  #     end
  #     #should_assign_to :chapter
  #     should set_the_flash.to(/updated/i)
  #     should redirect_to("the chapter view") { chapter_url(@chapter) }
  #   end

  #   context "on DELETE to :destroy" do
  #     setup do
  #       delete :destroy, :id => @chapter
  #     end
  #     should set_the_flash.to(/successfully destroyed/i)
  #     should redirect_to("the chapters list for a story") { story_chapters_url(@chapter.story) }
  #   end
 end
