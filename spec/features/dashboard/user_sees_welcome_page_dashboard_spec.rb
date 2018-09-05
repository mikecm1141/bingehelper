require 'rails_helper'

describe 'As any kind of user' do
  describe 'when I visit the root page' do
    before(:each) do
      @show1, @show2, @show3, @show4, @show5 = create_list(:show, 5)

      8.times { @show1.ratings << create(:rating) }
      6.times { @show2.ratings << create(:rating) }
      4.times { @show3.ratings << create(:rating) }
      2.times { @show3.ratings << create(:rating) }
      2.times { @show3.ratings << create(:rating) }
    end
    it 'displays a list of the most rated shows' do
      visit root_path

      within("#most-rated-shows") do

      end
    end
  end
end
