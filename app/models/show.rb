class Show < ApplicationRecord
  validates_presence_of     :title, :year, :runtime
  validates_uniqueness_of   :title
  validates_numericality_of :year
  validates_numericality_of :runtime, greater_than: 0, only_integer: true

  has_many :show_genres
  has_many :genres, through: :show_genres, dependent: :destroy
  has_many :ratings
  has_many :users, through: :ratings

  def self.most_active_shows(amount = 5)
    select("shows.*, COUNT (show_id) AS show_count")
      .joins(:ratings)
      .group(:show_id, :id)
      .order("show_count DESC")
      .limit(amount)
  end

  def avg_score
    ratings.average(:score).round(1)
  end

  def avg_bingecount
    ratings.average(:bingecount).round(1)
  end

  def bingescore
  ((((avg_score + avg_bingecount) / 2.0)  * runtime) * 0.5).round(1)
  end

  def total_ratings
    ratings.count
  end
end
