require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/genre/:id' do
    before(:each) do
      @genre = Genre.create!(title: 'Comedy')
    end
    scenario 'I see the show details' do
      visit admin_genre_path(@genre)

      expect(page).to have_content(@genre.title)
    end
    it 'has links to edit and delete that show' do
      visit admin_genre_path(@genre)

      expect(page).to have_link('Edit', href: edit_admin_genre_path(@genre))
      expect(page).to have_link('Delete', href: admin_genre_path(@genre))
    end
  end
end
