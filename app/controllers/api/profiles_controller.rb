class Api::ProfilesController < Api::ApiController
  def show
    @profile = User.find(params[:id])
    respond_to do |format|
      format.json {}
    end
  end
end
