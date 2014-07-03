require 'spec_helper'

describe ForumsController, type: :controller do
  before do
    @forum = create(:forum)
  end

  describe '#show' do
    before do
      get :show, :id => @forum
    end
    it { expect(assigns(:forum)).to be_an_instance_of(Forum) }
    it { expect(subject).to_not set_the_flash }
    it { expect(subject).to render_template(:show) }
    it { expect(response.status).to eq(200) }
  end
end
