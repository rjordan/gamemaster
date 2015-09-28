require 'rails_helper'

describe CampaignsController, type: :controller do
  let(:campaign) { FactoryGirl.create(:campaign) }

  describe 'GET index' do
    before do
      get :index
    end
    it { expect(response.status).to eq(200) }
    it { expect(subject).to_not set_flash }
    it { expect(assigns(:campaigns)).to respond_to(:each) }
    it { expect(subject).to render_template(:index) }
  end

  describe 'GET show' do
    before do
      get :show, id: campaign.id
    end
    it { expect(response.status).to eq(200) }
    it { expect(subject).to_not set_flash }
    it { expect(assigns(:campaign)).to eq(campaign) }
    it { expect(subject).to render_template(:show) }
  end

  describe 'GET new' do
    before do
      get :new
    end
    it { expect(response.status).to eq(200) }
    it { expect(subject).to_not set_flash }
    it { expect(assigns(:campaign)).to_not be_nil }
    it { expect(subject).to render_template(:new) }
  end

  describe 'GET edit' do
    before do
      get :edit, id: campaign.id
    end
    it { expect(response.status).to eq(200) }
    it { expect(subject).to_not set_flash }
    it { expect(assigns(:campaign)).to eq(campaign) }
    it { expect(subject).to render_template(:edit) }
  end

  #    context "on POST to :create" do
  #      setup do
  #        post :create, :campaign=>{:name=>'Unknown', :max_players=>5, :system_id=>1, :description=>'Test Campaign', :user_id=>@user.id}
  #      end
  #      #should_assign_to :campaign
  #      should set_flash.to(/created/i)
  #      should redirect_to("the campaign view") { campaign_url(assigns(:campaign)) }
  #    end

  #    context "on PUT to :update" do
  #      setup do
  #        put :update, :id=>@campaign, :campaign=>{:name=>'Unknown'}
  #      end
  #      #should_assign_to :campaign
  #      should set_flash.to(/updated/i)
  #      should redirect_to("the campaign view") { campaign_url(@campaign) }
  #    end

  #    context "on DELETE to :destroy" do
  #      setup do
  #        delete :destroy, :id=>@campaign
  #      end
  #      should set_flash.to(/successfully destroyed/i)
  #      should redirect_to("the campaigns list") { campaigns_url }
  #    end
end
