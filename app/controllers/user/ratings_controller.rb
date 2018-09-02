class User::RatingsController < ApplicationController
  before_action :authorize
  
  def create
    show = Show.find(params[:show_id])
    rating = current_user.ratings.create(rating_params)
    show.ratings << rating

    redirect_to show_path(show)
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :bingecount)
  end
end
