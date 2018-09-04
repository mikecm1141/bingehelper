class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :show

  # def show
  #   show = show_ratings.first.show_id
  #   Show.find(show)
  # end
end
