# frozen_string_literal: true

class PointStatusesController < ApplicationController
  def create
    player = Player.find_by(id: session[:player_id])
    game = player.game
    point_status = game.point_status || PointStatus.new(game:)
    point_status.status = point_status_params[:status].to_i
    point_status.broadcast_replace_to game, target: 'point_status' if point_status.save!
  end

  private

  def point_status_params
    params.require(:point_status).permit(:status)
  end
end
