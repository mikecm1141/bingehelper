require 'rails_helper'

describe 'As an admin' do
  describe 'when I want to delete a show' do
    before(:each) do
      @genre = create(:genre)
      admin  = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    end
    scenario 'I click delete on a genre show page and it takes me to the Genre index' do
      visit admin_genre_path(@genre)

      click_link 'Delete'

      expect(current_path).to eq(admin_genres_path)
      expect(page).to_not have_content(@genre.title)
    end
    scenario 'I click delete on the genre index page and it takes me back to the Genre index' do
      visit admin_genres_path

      find("#destroy-genre-#{@genre.id}").click

      expect(current_path).to eq(admin_genres_path)
      expect(page).to_not have_content(@genre.title)
    end
  end
end
