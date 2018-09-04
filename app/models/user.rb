class User < ApplicationRecord
  has_secure_password

  validates_presence_of   :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email

  has_many :ratings
  has_many :shows, through: :ratings

  enum role: %w[default admin]

  def score(show)
    ratings.find_by(show_id: show.id).score
  end

  def bingecount(show)
    ratings.find_by(show_id: show.id).bingecount
  end

  def bingescore(show)
    (bingecount(show) * score(show)) / 2.0
  end
end
