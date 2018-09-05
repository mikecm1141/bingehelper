require 'rails_helper'

describe Show, type: :model do
  describe 'validations' do
    it { should validate_presence_of     :title   }
    it { should validate_presence_of     :year    }
    it { should validate_uniqueness_of   :title   }
    it { should validate_numericality_of :year    }
    it { should validate_presence_of     :runtime }
    it do
      should validate_numericality_of(:runtime).
        is_greater_than(0).
        only_integer
    end
  end
  describe 'relationships' do
    it { should have_many :show_genres                     }
    it { should have_many(:genres).through(:show_genres)   }
    it { should have_many :ratings                    }
    it { should have_many(:users).through(:ratings)        }
  end
  describe 'Class Methods' do
    it '.most_active_shows' do
      show1, show2, show3, show4, show5 = create_list(:show, 5)

      6.times { show1.ratings << create(:rating, show: show1) }
      8.times { show2.ratings << create(:rating, show: show2) }
      1.times { show3.ratings << create(:rating, show: show3) }
      4.times { show4.ratings << create(:rating, show: show4) }
      2.times { show5.ratings << create(:rating, show: show5) }

      expected = [show2, show1, show4, show5, show3]

      expect(Show.most_active_shows).to eq(expected)
    end
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
      bingescore = (Math.sqrt(@show.avg_bingecount * @show.runtime) * (@show.avg_score / 10)).round(1)

      expect(@show.bingescore).to eq(bingescore)
    end
    it '#total_ratings' do
      expect(@show.total_ratings).to eq(3)
    end
  end
end
