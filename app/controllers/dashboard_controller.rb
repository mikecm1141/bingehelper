class DashboardController < ApplicationController
  def index
    @most_rated_shows        = Show.most_rated_shows
    @top_shows_by_score      = Show.top_shows_by_score
    @top_shows_by_bingecount = Show.top_shows_by_bingecount
  end
end
