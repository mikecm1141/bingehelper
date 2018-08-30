class Show < ApplicationRecord
  validates_presence_of   :title, :year
  validates_uniqueness_of :title
  validates_numericality_of :year
end
