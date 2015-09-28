module Api
  module V1
    class CampaignsController < Api::ApiController
      def index
        @campaigns = Campaign.where(public: true)
        respond_to do |format|
          format.json { render json: @campaigns, meta: { total_count: @campaigns.count } }
        end
      end

      def show
        @campaign = Campaign.includes(:user, :system).find(params[:id])
        respond_to do |format|
          format.json { render json: @campaign, meta: { test: true } }
        end
      end
    end
  end
end
