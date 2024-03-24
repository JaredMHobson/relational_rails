class DeveloperGamesController < ApplicationController
  def index
    @developer = Developer.find(params[:developer_id])
    @games = @developer.games
    
    if params[:games_after_year]
      @games = @developer.games.where("year_released >= #{params[:games_after_year]}")
    end
    
    if params[:sort] == 'alphabetically'
      @games = @developer.games.order(:name)
    end
    
    # case
    # when params[:sort] == 'alphabetically'
    #   @games = @developer.games.order(:name)
    # when params[:games_after_year]
    #   @games = @developer.games.where("year_released >= #{params[:games_after_year]}")
    # else
    #   @games = @developer.games
    # end

    # if params[:sort] == 'alphabetically'
    #   @games = @developer.games.order(:name)
    # else
    #   @games = @developer.games
    # end
  end

  def new
    @developer = Developer.find(params[:developer_id])
  end

  def create
    developer = Developer.find(params[:developer_id])
    game = Game.create!(game_params)

    redirect_to "/developers/#{developer.id}/games"
  end

private
  def game_params
    params.permit(:name, :has_multiplayer, :year_released, :developer_id)
  end
end