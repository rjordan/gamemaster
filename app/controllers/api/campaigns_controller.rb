class Api::CampaignsController < Api::ApiController
  respond_to :json
  
  def index
    @campaigns = Campaign.where(public: true)
    respond_with @campaigns
  end
end
