describe Rating, type: :model do
  describe 'Relationships' do
    it { should belong_to :user }
    it { should have_many :show_ratings }
  end
end
