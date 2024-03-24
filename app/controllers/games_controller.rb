class GamesController < ApplicationController
  def index
    @games = Game.all.where(has_multiplayer: true)
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

  def edit
    @game = Game.find(params[:game_id])
    @developers = Developer.all
    @developer = Developer.find(@game.developer_id)
  end

  def update
    game = Game.find(params[:game_id])
    game.update(game_params)

    redirect_to "/games/#{game.id}"
  end

  def destroy
    game = Game.find(params[:id])
    game.delete

    redirect_to '/games'
  end

private
  def game_params
    params.permit(:name, :has_multiplayer, :year_released, :developer_id)
  end
end