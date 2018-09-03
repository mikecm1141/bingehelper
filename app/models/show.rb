class Show < ApplicationRecord
  validates_presence_of     :title, :year, :runtime
  validates_uniqueness_of   :title
  validates_numericality_of :year
  validates_numericality_of :runtime, greater_than: 0

  has_many :show_genres
  has_many :show_ratings
  has_many :genres, through: :show_genres, dependent: :destroy
  has_many :ratings, through: :show_ratings
  has_many :users, through: :ratings

  def avg_score
    ratings.average(:score).round(1)
  end

  def avg_bingecount
    ratings.average(:bingecount).round(1)
  end

  def bingescore
  (  (avg_score * avg_bingecount) / 2.0).round(1)
  end
end
