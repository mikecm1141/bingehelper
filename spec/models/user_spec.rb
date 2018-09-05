require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of   :name }
    it { should validate_presence_of   :email }
    it { should validate_presence_of   :password }
    it { should validate_presence_of   :password_confirmation }
    it { should validate_uniqueness_of :email }
  end
  describe 'Relationships' do
    it { should have_many :ratings }
    it { should have_many(:shows).through(:ratings) }
  end
  describe 'Instance Methods' do
    before(:each) do
      @show = create(:show)
      @rating = create(:rating)
      @user = User.find(@rating.user_id)
      @show.ratings << @rating
    end
    it '#score(show)' do
      expect(@user.score(@show)).to eq(@rating.score)
    end
    it '#bingecount(show)' do
      expect(@user.bingecount(@show)).to eq(@rating.bingecount)
    end
    it '#bingescore(show)' do
      expected_result = (Math.sqrt(@user.bingecount(@show) * @show.runtime) * (@user.score(@show) / 10)).round(1)

      expect(@user.bingescore(@show)).to eq(expected_result)
    end
    it '#show_rated?(show)' do
      expect(@user.show_rated?(@show)).to be_truthy
    end
  end
end
