class Api::V1::CampaignsController < Api::ApiController
  def index
    @campaigns = Campaign.where(public: true)
    respond_to do |format|
      format.json {}
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.json {}
    end
  end
end
