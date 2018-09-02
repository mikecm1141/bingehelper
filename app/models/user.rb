class User < ApplicationRecord
  has_secure_password

  validates_presence_of   :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email

  has_many :ratings
  has_many :show_ratings, through: :ratings
  has_many :shows, through: :show_ratings

  def score(show)
    show_rating = show_ratings.find_by(show_id: show.id)
    ratings.find(show_rating.id).score
  end

  def bingecount(show)
    show_bingecount = show_ratings.find_by(show_id: show.id)
    ratings.find(show_bingecount.id).bingecount
  end

  def bingescore(show)
    (bingecount(show) * score(show)) / 2.0
  end
end
