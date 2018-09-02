class GenresController < ApplicationController
  def index
    @genres = Genre.order(title: :asc)
  end

  def show
    @genre = Genre.find(params[:id])
  end
end
