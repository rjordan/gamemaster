require 'rails_helper'

describe ForumsController, type: :controller do
  let(:forum) { FactoryGirl.create(:forum) }

  describe '#show' do
    before do
      get :show, id: forum
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:forum)).to be_an_instance_of(Forum) }
    it { expect(subject).to_not set_flash }
    it { expect(subject).to render_template(:show) }
  end
end
