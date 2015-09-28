require 'rails_helper'

describe StoriesController, type: :controller do
  let(:story) { FactoryGirl.create(:story) }

  describe '#index' do
    before do
      get :index, campaign_id: story.campaign
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:stories)).to respond_to(:each) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:index) }
  end

  describe '#show' do
    before do
      get :show, id: story, campaign_id: story.campaign
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:story)).to be_instance_of(Story) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:show) }
  end

  describe '#new' do
    before do
      get :new, campaign_id: story.campaign
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:story)).to be_instance_of(Story) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:new) }
  end

  # context "on POST to :create" do
  #   setup do
  #     post :create, :campaign_id => @story.campaign.id, :story => { :campaign_id => @story.campaign.id, :name => 'Unknown', :public_description => 'Nothing' }
  #   end
  #   #should_assign_to :story
  #   should set_flash.to(/created/i)
  #   should redirect_to("the story view") { story_path(assigns(:story)) }
  # end

  describe '#edit' do
    before do
      get :edit, id: story, campaign_id: story.campaign
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:story)).to be_instance_of(Story) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:edit) }
  end

  # context "on PUT to :update" do
  #   setup do
  #     put :update, :story => { :name => 'Unknown' }, :id => @story
  #   end
  #   #should_assign_to :story
  #   should set_flash.to(/updated/i)
  #   should redirect_to("the story view") { story_path(assigns(:story)) }
  # end

  # context "on DELETE to :destroy" do
  #   setup do
  #     delete :destroy, :id => @story
  #   end
  #   should set_flash.to(/successfully destroyed/i)
  #   should redirect_to("the list of stories for a campaign") { campaign_stories_path(@story.campaign) }
  # end

  # end
end
