require 'rails_helper'

describe Show, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }
  end
end
