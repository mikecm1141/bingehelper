require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/genre/:id' do
    before(:each) do
      @genre = create(:genre)
      @show1, @show2 = create_list(:show, 2)

      @genre.shows << @show1
      @genre.shows << @show2
    end
    scenario 'I see the genre details' do
      visit admin_genre_path(@genre)

      expect(page).to have_content(@genre.title)
    end
    it 'has links to edit and delete that genre' do
      visit admin_genre_path(@genre)

      expect(page).to have_link('Edit', href: edit_admin_genre_path(@genre))
      expect(page).to have_link('Delete', href: admin_genre_path(@genre))
    end
    it 'displays all shows in that genre and links to them' do
      visit admin_genre_path(@genre)

      expect(page).to have_link(@show1.title, href: admin_show_path(@show1))
      expect(page).to have_link(@show2.title, href: admin_show_path(@show2))
    end
  end
end
