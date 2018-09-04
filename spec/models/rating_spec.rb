require 'rails_helper'

describe Rating, type: :model do
  describe 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :show }
  end
end
