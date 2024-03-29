class DeveloperGamesController < ApplicationController
  def index
    @developer = Developer.find(params[:developer_id])

    case
    when params[:games_after_year]
      @games = @developer.games.show_games_released_after(params[:games_after_year])
    when params[:sort] == 'alphabetically'
      @games = @developer.games.sort_games_by_name
    else
      @games = @developer.games
    end
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
