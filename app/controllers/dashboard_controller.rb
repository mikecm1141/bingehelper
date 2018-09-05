class DashboardController < ApplicationController
  def index
    @most_rated_shows = Show.most_rated_shows
  end
end
