# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: %i[show]

  # GET /games/1 or /games/1.json
  def show
    @player = @game.players.where(id: session[:player_id]).first if session[:player_id].present?
    @player = Player.new(game: @game) if @player.blank?
    @players = @game.players
    @point_status = @game.point_status || PointStatus.new(game: @game)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_game
    @game = Game.find_by(token: params[:token])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name)
  end
end
