class DevelopersController < ApplicationController
  def index
    @developers = Developer.sort_by_created_at

    if params[:sort] == 'total_games'
      @developers = Developer.sort_by_total_games
    elsif params[:sort] == 'total_games'
      @developers = Developer.sort_by_created_at
    end
  end

  def new
  end

  def create
    developer = Developer.create!(developer_params)

    redirect_to '/developers'
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    developer = Developer.find(params[:id])
    developer.update(developer_params)

    redirect_to "/developers/#{developer.id}"
  end

  def destroy
    developer = Developer.find(params[:id])
    games = developer.games

    games.destroy_all
    developer.destroy

    redirect_to '/developers'
  end

private
  def developer_params
    params.permit(:name, :is_indie, :year_founded)
  end
end
