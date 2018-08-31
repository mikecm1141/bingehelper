class Admin::GenresController < ApplicationController
  before_action :set_genre, only: %i[edit show update destroy]
  def index
  end

  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash['card-panel green center-align'] = "'#{genre.title}' has been added!"
      redirect_to admin_genres_path
    else
      flash['card-panel red lighten-2 center-align'] = genre.errors.full_messages.join('. ')
      redirect_to new_admin_genre_path
   end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      flash['card-panel green center-align'] = "'#{@genre.title}' has been edited!"
      redirect_to admin_genre_path(@genre)
    else
      flash['card-panel red lighten-2 center-align'] = @genre.errors.full_messages.join('. ')
      redirect_to edit_admin_genre_path(@genre)
    end
  end

  def show
  end

  private

  def genre_params
    params.require(:genre).permit(:title)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
