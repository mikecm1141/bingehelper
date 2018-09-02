class GenresController < ApplicationController
  def index
    @genres = Genre.order(title: :asc)
  end
end
