class ShowsController < ApplicationController
  def index
    @shows = Show.order(title: :asc)
  end

  def show
    @show   = Show.find(params[:id])
    @genres = @show.genres.order(title: :asc)
    @rating = Rating.new
  end
end
