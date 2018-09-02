require 'rails_helper'

describe 'As a visitor or user' do
  before(:each) do
    @show1,@show2,@show3 = create_list(:show, 3)
    @genre = create(:genre)

    @genre.shows << [@show1, @show2, @show3]
  end
  describe 'when I visit /genre/:id/' do
    scenario 'I see genre details and shows in that genre' do
      visit genre_path(@genre)

      expect(page).to have_content(@show1.title)
      expect(page).to have_content(@show2.title)
      expect(page).to have_content(@show3.title)
    end
  end
end
