module Api
  module V1
    class ProfilesController < Api::ApiController
      def show
        @profile = User.find(params[:id])
        render json: @profile
      end
    end
  end
end
