require 'rails_helper'

describe 'As a visitor or user' do
  before(:each) do
    @genre1, @genre2 = create_list(:genre, 2)
  end
  describe 'when I visit /genres' do
    scenario 'I see a list of all genres' do
      visit genres_path

      expect(page).to have_content(@genre1.title)
      expect(page).to have_content(@genre1.title)
    end
    scenario 'I can click genre title and go to genre show page' do
      visit genres_path

      click_link @genre1.title

      expect(current_path).to eq(genre_path(@genre1))
      expect(page).to have_content(@genre1.title)
    end
  end
end
