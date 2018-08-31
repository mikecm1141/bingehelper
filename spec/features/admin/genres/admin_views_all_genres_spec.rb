require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/shows' do
    before(:each) do
      @genre1 = Genre.create!(title: 'Comedy')
      @genre2 = Genre.create!(title: 'Action')
      @genre3 = Genre.create!(title: 'Sci-Fi')
    end
    scenario 'I see a list of all genres' do
      visit admin_genres_path

      expect(page).to have_content(@genre1.title)
      expect(page).to have_content(@genre2.title)
      expect(page).to have_content(@genre3.title)
    end
    scenario 'I click a genre title and go to that genres page' do
      visit admin_genres_path

      click_link @genre1.title

      expect(current_path).to eq(admin_genre_path(@genre1))
      expect(page).to have_content(@genre1.title)
    end
    scenario 'I click on edit and it takes me to the edit genre page' do
      visit admin_genres_path

      find("#edit-genre-#{@genre1.id}").click

      expect(current_path).to eq(edit_admin_genre_path(@genre1))
    end
    scenario 'It has a link to delete show' do
      visit admin_genres_path

      expect(page).to have_link('Delete')
    end
  end
end
