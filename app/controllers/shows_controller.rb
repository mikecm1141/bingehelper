class ShowsController < ApplicationController
  def show
    @show = Show.find(params[:id])
    @rating = Rating.new
  end
end
