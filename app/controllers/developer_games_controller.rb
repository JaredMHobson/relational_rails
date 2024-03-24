class DeveloperGamesController < ApplicationController
  def index
    @developer = Developer.find(params[:developer_id])
    @games = @developer.games
  end

  def new
  end
end