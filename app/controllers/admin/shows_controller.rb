class Admin::ShowsController < ApplicationController
  before_action :admin_authorize
  before_action :set_show, only: %i[show edit update destroy]

  def index
    @shows = Show.order(title: :asc)
  end

  def new
    @show = Show.new
  end

  def show
  end

  def create
    show = Show.new(show_params)
    if show.save
      flash['card-panel green center-align'] = "'#{show.title}' has been added!"
      redirect_to admin_shows_path
    else
      flash['card-panel red lighten-2 center-align'] = show.errors.full_messages.join('. ')
      redirect_to new_admin_show_path
    end
  end

  def edit
  end

  def update
    if @show.update(show_params)
      flash['card-panel green center-align'] = "'#{@show.title}' has been edited!"
      redirect_to admin_show_path(@show)
    else
      flash['card-panel red lighten-2 center-align'] = @show.errors.full_messages.join('. ')
      redirect_to edit_admin_show_path(@show)
    end
  end

  def destroy
    @show.destroy

    redirect_to admin_shows_path
  end

  private

  def show_params
    params.require(:show).permit(:title, :year)
  end

  def set_show
    @show = Show.find(params[:id])
  end
end
