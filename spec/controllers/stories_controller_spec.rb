require 'spec_helper'

describe StoriesController do
  before do
    @story = create(:story)
  end

  describe '#index' do
    before do
      get :index, :campaign_id => @story.campaign
    end
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:index) }
    it { expect(response.status).to eq(200) }
  end

  describe '#show' do
    before do
      get :show, :id => @story, :campaign_id => @story.campaign
    end
    it { expect(assigns(:story)).to be_instance_of(Story) }
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:show) }
    it { expect(response.status).to eq(200) }
  end

  describe '#new' do
    before do
      get :new, :campaign_id => @story.campaign
    end
    it { expect(assigns(:story)).to be_instance_of(Story) }
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:new) }
    it { expect(response.status).to eq(200) }
  end

    # context "on POST to :create" do
    #   setup do
    #     post :create, :campaign_id => @story.campaign.id, :story => { :campaign_id => @story.campaign.id, :name => 'Unknown', :public_description => 'Nothing' }
    #   end
    #   #should_assign_to :story
    #   should set_the_flash.to(/created/i)
    #   should redirect_to("the story view") { story_path(assigns(:story)) }
    # end

  describe '#edit' do
    before do
      get :edit, :id => @story, :campaign_id => @story.campaign
    end
    it { expect(assigns(:story)).to be_instance_of(Story) }
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:edit) }
    it { expect(response.status).to eq(200) }
  end

    # context "on PUT to :update" do
    #   setup do
    #     put :update, :story => { :name => 'Unknown' }, :id => @story
    #   end
    #   #should_assign_to :story
    #   should set_the_flash.to(/updated/i)
    #   should redirect_to("the story view") { story_path(assigns(:story)) }
    # end

    # context "on DELETE to :destroy" do
    #   setup do
    #     delete :destroy, :id => @story
    #   end
    #   should set_the_flash.to(/successfully destroyed/i)
    #   should redirect_to("the list of stories for a campaign") { campaign_stories_path(@story.campaign) }
    # end

  #end
end 
