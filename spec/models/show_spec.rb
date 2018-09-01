require 'rails_helper'

describe Show, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :year }
    it { should validate_uniqueness_of :title }
    it { should validate_numericality_of :year }
  end
  describe 'relationships' do
    it { should have_many :show_genres }
    it { should have_many(:genres).through(:show_genres) }
    it { should have_many :show_ratings }
    it { should have_many(:ratings).through(:show_ratings) }
  end
end
