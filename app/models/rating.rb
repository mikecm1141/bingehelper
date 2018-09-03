class Rating < ApplicationRecord
  belongs_to :user
  has_many   :show_ratings

  def show
    show = show_ratings.first.show_id
    Show.find(show)
  end
end
