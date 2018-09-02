require 'rails_helper'

describe Show, type: :model do
  describe 'validations' do
    it { should validate_presence_of     :title }
    it { should validate_presence_of     :year }
    it { should validate_uniqueness_of   :title }
    it { should validate_numericality_of :year }
  end
  describe 'relationships' do
    it { should have_many :show_genres }
    it { should have_many(:genres).through(:show_genres) }
    it { should have_many :show_ratings }
    it { should have_many(:ratings).through(:show_ratings) }
    it { should have_many(:users).through(:ratings) }
  end
  describe 'Instance Methods' do
    before(:each) do
      @show = create(:show)
      @rating1, @rating2, @rating3 = create_list(:rating, 3)
      @show.ratings << [@rating1, @rating2, @rating3]
    end
    it '#avg_score' do
      avg_show_score = ((@rating1.score + @rating2.score + @rating3.score) / 3.0).round(1)

      expect(@show.avg_score).to eq(avg_show_score)
    end
    it '#avg_bingecount' do
      avg_bingecount = ((@rating1.bingecount + @rating2.bingecount + @rating3.bingecount) / 3.0).round(1)

      expect(@show.avg_bingecount).to eq(avg_bingecount)
    end
    it '#bingescore' do
      bingescore = ((@show.avg_score * @show.avg_bingecount) / 2.0).round(1)

      expect(@show.bingescore).to eq(bingescore)
    end
  end
end
