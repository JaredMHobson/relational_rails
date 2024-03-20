class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
  end

  def create
    game = Game.new({
      name: params[:name],
      has_multiplayer: params[:has_multiplayer],
      year_released: params[:year_released]
    })
    # Drop down menu with a list of devs to relate it to? 

    game.save

    redirect_to '/games'
  end

  def show
    @game = Game.find(params[:id])
  end
end