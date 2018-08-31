class Show < ApplicationRecord
  validates_presence_of   :title, :year
  validates_uniqueness_of :title
  validates_numericality_of :year

  has_many :show_genres
  has_many :genres, through: :show_genres
end
