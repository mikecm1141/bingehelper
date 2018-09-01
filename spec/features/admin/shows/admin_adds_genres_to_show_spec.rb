require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    @show = create(:show)
    @genre1, @genre2, @genre3, @genre4 = create_list(:genre, 4)
  end
  describe 'when I visit /admin/shows/:id I can add genres to a show' do
    scenario 'I can select a genre to add to a show' do
      visit admin_show_path(@show)

      select @genre1.title, from: "show_genre[id][]"
      select @genre2.title, from: "show_genre[id][]"
      select @genre3.title, from: "show_genre[id][]"
      click_on 'Update Genres'

      expect(current_path).to eq(admin_show_path(@show))
      within(".show-genres") do
        expect(page).to have_content(@genre1.title)
        expect(page).to have_content(@genre2.title)
        expect(page).to have_content(@genre3.title)
      end
    end
  end
end
