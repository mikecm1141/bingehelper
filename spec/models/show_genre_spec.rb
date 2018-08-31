describe ShowGenre, type: :model do
  describe 'relationships' do
    it { should belong_to :show }
    it { should belong_to :genre }
  end
end
