class GamesController < ApplicationController
  def index
    if params[:developer_id]
      @games = Developer.find(params[:developer_id]).games
    else
      @games = Game.all
    end
  end

  def new
    @developers = Developer.all
  end

  def create
    game = Game.new({
      name: params[:name],
      has_multiplayer: params[:has_multiplayer],
      year_released: params[:year_released],
      developer_id: params[:developer_id]
    })
    # Drop down menu with a list of devs to relate it to? 

    game.save

    redirect_to '/games'
  end

  def show
    @game = Game.find(params[:id])
  end
end