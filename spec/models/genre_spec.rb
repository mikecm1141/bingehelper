require 'rails_helper'

describe Genre, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }
  end
  describe 'relationships' do
    it { should have_many :show_genres }
    it { should have_many(:shows).through(:show_genres) }
  end
end
