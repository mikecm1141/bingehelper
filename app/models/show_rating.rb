class ShowRating < ApplicationRecord
  belongs_to :show
  belongs_to :rating
end
