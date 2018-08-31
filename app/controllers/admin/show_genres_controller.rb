class Admin::ShowGenresController < ApplicationController
  def create
    # grab the show we want to add genres to
    show = Show.find(params[:show_id])

    # clean up the empty string from this array
    params[:show_genre][:id].reject!(&:empty?)

    # iterate over the genre ids and add to show association
    params[:show_genre][:id].each do |genre_id|
      show.show_genres.create(genre_id: genre_id.to_i)
    end

    # take us back to the Show show page
    redirect_to admin_show_path(show)
  end
end
