class DashboardController < ApplicationController
  def index
    @most_active_shows = Show.most_active_shows
  end
end
