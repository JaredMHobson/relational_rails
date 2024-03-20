class DevelopersController < ApplicationController
  def index
    @developers = Developer.all
  end

  def new
  end

  def create
    developer = Developer.new({
      name: params[:name],
      is_indie: params[:is_indie],
      year_founded: params[:year_founded]
    })

    developer.save

    redirect_to '/developers'
  end

  def show
    @developer = Developer.find(params[:id])
  end
end
