class PointStatusesController < ApplicationController
  def create
    player = Player.find_by(id: session[:player_id])
    game = player.game
    point_status = game.point_status || PointStatus.new(game: game)
    point_status.status = point_status_params[:status].to_i
    if point_status.save!
      point_status.broadcast_replace_to "#{game.token}/players", target: 'point_status'
    end
  end

  private

  def point_status_params
    params.require(:point_status).permit(:status)
  end
end
