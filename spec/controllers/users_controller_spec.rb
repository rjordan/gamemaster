require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe '#show' do
    before do
      get :show, id: user
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:user)).to be_instance_of(User) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:show) }
  end

  describe '#edit' do
    before do
      get :edit, id: user
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:user)).to be_instance_of(User) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:edit) }
  end
end
