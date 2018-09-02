class Genre < ApplicationRecord
  validates_presence_of   :title
  validates_uniqueness_of :title

  has_many :show_genres
  has_many :shows, through: :show_genres, dependent: :destroy
end
