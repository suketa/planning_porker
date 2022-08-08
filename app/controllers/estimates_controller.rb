class EstimatesController < ApplicationController
  def create
    @estimate = Estimate.find_or_initialize_by(player_id: session[:player_id])
    @estimate.point = params_estimate[:point]
    @estimate.save
  end

  private

  def params_estimate
    params.require(:estimate).permit(:point)
  end
end
