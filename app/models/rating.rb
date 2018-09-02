class Rating < ApplicationRecord
  belongs_to :user
  has_many   :show_ratings
end
