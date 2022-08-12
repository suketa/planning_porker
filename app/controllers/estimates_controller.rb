# frozen_string_literal: true

class EstimatesController < ApplicationController
  def create
    Estimate.save_and_broadcast(session[:player_id], params_estimate[:point])
  end

  private

  def params_estimate
    params.require(:estimate).permit(:point)
  end
end
