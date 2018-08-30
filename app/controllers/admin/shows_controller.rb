class Admin::ShowsController < ApplicationController
  def new
    @show = Show.new
  end

  def create
    show = Show.new(show_params)
    show.save

    redirect_to admin_show_path(show)
  end

  def show
    @show = Show.find(params[:id])
  end

  private

  def show_params
    params.require(:show).permit(:title)
  end
end
