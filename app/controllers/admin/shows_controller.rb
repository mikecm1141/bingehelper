class Admin::ShowsController < ApplicationController
  before_action :set_show, only: %i[show edit update]

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
      flash[:success] = "'#{show.title}' has been added!"
      redirect_to admin_show_path(show)
    else
      flash[:failure] = show.errors.full_messages.join('. ')
      redirect_to new_admin_show_path
    end
  end

  def edit
  end

  def update
    if @show.update(show_params)
      flash[:success] = "'#{@show.title}' has been edited!"
      redirect_to admin_show_path(@show)
    else
      flash[:failure] = @show.errors.full_messages.join('. ')
      redirect_to edit_admin_show_path(@show)
    end
  end

  private

  def show_params
    params.require(:show).permit(:title)
  end

  def set_show
    @show = Show.find(params[:id])
  end
end
