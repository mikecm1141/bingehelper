class Admin::ShowsController < ApplicationController
  def new
    @show = Show.new
  end

  def create
    show = Show.new(show_params)
    if show.save
      flash[:success] = "'#{show.title}' has been added!"
      redirect_to admin_show_path(show)
    else
      flash[:failure] = show.errors.full_messages.join('. ')
      redirect_to new_admin_show_path
    end
  end

  def show
    @show = Show.find(params[:id])
  end

  private

  def show_params
    params.require(:show).permit(:title)
  end
end
