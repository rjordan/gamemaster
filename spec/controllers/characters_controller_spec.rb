require 'rails_helper'

describe CharactersController, type: :controller do
  let(:character) { FactoryGirl.create(:character) }

  describe '#index' do
    before do
      get :index, campaign_id: character.campaign
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:characters)).to_not be_nil }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:index) }
  end

  describe '#show' do
    before do
      get :show, id: character, campaign_id: character.campaign
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:character)).to be_an_instance_of(Character) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:show) }
  end

  describe '#new' do
    before do
      get :new, campaign_id: character.campaign
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:character)).to be_an_instance_of(Character) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:new) }
  end

  describe '#edit' do
    before do
      get :edit, id: character, campaign_id: character.campaign
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:character)).to be_an_instance_of(Character) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:edit) }
  end

  #   context "on POST to :create" do
  #     setup do
  #       post :create, :character => { :campaign_id => @character.campaign.id, :name => 'Unknown', :public_description => 'Nothing', :statistics => 'None' }, :campaign_id => @character.campaign
  #     end
  #     #should_assign_to :character
  #     should set_flash.to(/created/i)
  #     should redirect_to("the character view") { character_url(assigns(:character)) }
  #   end

  #   context "on PUT to :update" do
  #     setup do
  #       put :update, :character => { :name => 'Unknown' }, :id => @character
  #     end
  #     #should_assign_to :character
  #     should set_flash.to(/updated/i)
  #     should redirect_to("the character view") { character_url(@character) }
  #   end

  #   context "on DELETE to :destroy" do
  #     setup do
  #       delete :destroy, :id => @character
  #     end
  #     should set_flash.to(/successfully destroyed/i)
  #     should redirect_to("the campaign view") { campaign_url(@character.campaign) }
  #   end
end
