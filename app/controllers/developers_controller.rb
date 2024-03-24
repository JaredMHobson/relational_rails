class DevelopersController < ApplicationController
  def index
    @developers = Developer.all.order(created_at: :DESC)
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

private
  def developer_params
    params.permit(:name, :is_indie, :year_founded)
  end
end
