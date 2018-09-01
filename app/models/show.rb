class Show < ApplicationRecord
  validates_presence_of   :title, :year
  validates_uniqueness_of :title
  validates_numericality_of :year

  has_many :show_genres
  has_many :show_ratings
  has_many :genres, through: :show_genres, dependent: :destroy
  has_many :ratings, through: :show_ratings
  has_many :users, through: :ratings
end
