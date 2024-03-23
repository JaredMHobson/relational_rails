class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @developers = Developer.all
  end

  def create
    game = Game.create!(game_params)
    redirect_to '/games'
  end

  def show
    @game = Game.find(params[:game_id])
  end

private
  def game_params
    params.permit(:name, :has_multiplayer, :year_released, :developer_id)
  end
end