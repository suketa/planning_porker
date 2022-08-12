# frozen_string_literal: true

class EstimatesController < ApplicationController
  def create
    @estimate = Estimate.find_or_initialize_by(player_id: session[:player_id])
    @estimate.point = params_estimate[:point]
    return unless @estimate.save!

    @estimate.broadcast_update_to @estimate.player.game, target: "#{@estimate.player_id}_estimate"
  end

  private

  def params_estimate
    params.require(:estimate).permit(:point)
  end
end
