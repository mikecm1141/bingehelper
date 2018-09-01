require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should validate_uniqueness_of :email }
  end
  describe 'Relationships' do
    it { should have_many :ratings }
    it { should have_many(:show_ratings).through(:ratings) }
    it { should have_many(:shows).through(:show_ratings) }
  end
  describe 'Instance Methods' do
    it '#score(show)' do
      show = create(:show)
      rating = create(:rating)
      user = User.find(rating.user_id)
      show.ratings << rating

      expect(user.score(show)).to eq(rating.score)
    end
    it '#bingecount(show)' do
      show = create(:show)
      rating = create(:rating)
      user = User.find(rating.user_id)
      show.ratings << rating

      expect(user.bingecount(show)).to eq(rating.bingecount)
    end
    it '#bingescore(show)' do
      show = create(:show)
      rating = create(:rating)
      user = User.find(rating.user_id)
      show.ratings << rating

      expected_result = (rating.bingecount * rating.score) / 2.0

      expect(user.bingescore(show)).to eq(expected_result)
    end
  end
end
