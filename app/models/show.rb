class Show < ApplicationRecord
  validates_presence_of     :title, :year, :runtime
  validates_uniqueness_of   :title
  validates_numericality_of :year
  validates_numericality_of :runtime, greater_than: 0, only_integer: true

  has_many :show_genres
  has_many :genres, through: :show_genres, dependent: :destroy
  has_many :ratings
  has_many :users, through: :ratings

  def self.most_rated_shows(amount = 5)
    select("shows.*, COUNT (show_id) AS show_count")
      .joins(:ratings)
      .group(:show_id, :id)
      .order("show_count DESC")
      .limit(amount)
  end

  def self.top_shows_by_score(amount = 5)
    select("shows.*, AVG (score) AS avg_score")
      .joins(:ratings)
      .group(:show_id, :id)
      .order("avg_score DESC")
      .limit(amount)
  end

  def self.top_shows_by_bingecount(amount = 5)
    select("shows.*, AVG (bingecount) AS avg_bingecount")
      .joins(:ratings)
      .group(:show_id, :id)
      .order("avg_bingecount DESC")
      .limit(amount)
  end

  def self.top_shows_by_bingescore(amount = 5)
    select("shows.*, SQRT((AVG(bingecount) * runtime) * (AVG(score) / 10)) AS avg_bingescore")
      .joins(:ratings)
      .group(:show_id, :id)
      .order("avg_bingescore DESC")
      .limit(5)
  end

  def avg_score
    ratings.average(:score).round(1)
  end

  def avg_bingecount
    ratings.average(:bingecount).round(1)
  end

  def bingescore
  (Math.sqrt(avg_bingecount * runtime) * (avg_score / 10)).round(1)
  end

  def total_ratings
    ratings.count
  end
end
