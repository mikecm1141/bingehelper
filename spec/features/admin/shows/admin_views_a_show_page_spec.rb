require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    @show  = create(:show)
    @genre = create(:genre)
    @show.genres << @genre
  end
  describe 'when I visit /admin/show/:id' do
    scenario 'I see the show details' do
      visit admin_show_path(@show)

      expect(page).to have_content(@show.title)
      expect(page).to have_content(@show.year)
    end
    it 'has links to edit and delete that show' do
      visit admin_show_path(@show)

      expect(page).to have_link('Edit', href: edit_admin_show_path(@show))
      expect(page).to have_link('Delete', href: admin_show_path(@show))
    end
    it 'has links from genre tags to genre show page' do
      visit admin_show_path(@show)

      click_link @genre.title

      expect(current_path).to eq(admin_genre_path(@genre))
    end
  end
end
