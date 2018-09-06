class User < ApplicationRecord
  has_secure_password

  validates_presence_of   :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email

  has_many :ratings
  has_many :shows, through: :ratings

  enum role: %w[default admin]

  def show_rated?(show)
    ratings.exists?(show_id: show.id)
  end

  def current_user_rating(show)
    ratings.find_by(show_id: show.id)
  end

  def score(show)
    ratings.find_by(show_id: show.id).score
  end

  def bingecount(show)
    ratings.find_by(show_id: show.id).bingecount
  end

  def bingescore(show)
    (Math.sqrt(bingecount(show) * show.runtime) * (score(show) / 10.0)).round(1)
  end
end
