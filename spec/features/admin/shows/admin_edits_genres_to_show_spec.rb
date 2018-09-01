require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    @show = create(:show)
    @genre1, @genre2, @genre3, @genre4 = create_list(:genre, 4)
    @show.genres << @genre1
    @show.genres << @genre2
    @show.genres << @genre3

    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  describe 'when I update genres on the show Show page' do
    it 'updates new genres and removes deselected ones' do
      visit admin_show_path(@show)

      within(".show-genres") do
        expect(page).to have_content(@genre1.title)
        expect(page).to have_content(@genre2.title)
        expect(page).to have_content(@genre3.title)
      end

      select   @genre4.title, from: "show_genre[id][]"
      unselect @genre3.title, from: "show_genre[id][]"
      click_on 'Update Genres'

      expect(current_path).to eq(admin_show_path(@show))
      within(".show-genres") do
        expect(page).to have_content(@genre1.title)
        expect(page).to have_content(@genre2.title)
        expect(page).to have_content(@genre4.title)
      end
    end
  end
end
