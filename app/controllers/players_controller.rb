class PlayersController < ApplicationController
  before_action :set_player, only: %i[show]

  # GET /players/1 or /players/1.json
  def show
    @players = @player.game.players
    @point_status = @player.game.point_status || PointStatus.new(game: @player.game)
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        session[:player_id] = @player.id
        @player.broadcast_append_to @player.game
        format.html { redirect_to player_url(@player) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(:name, :game_id)
  end
end
