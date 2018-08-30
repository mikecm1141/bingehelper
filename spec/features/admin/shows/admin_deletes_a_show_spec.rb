require 'rails_helper'

describe 'As an admin' do
  describe 'when I want to delete a show' do
    before(:each) do
      @show = Show.create!(title: 'Futurama')
    end
    scenario 'I click delete on a show page and it takes me to the Show index' do
      visit admin_show_path(@show)

      click_link 'Delete'

      expect(current_path).to eq(admin_shows_path)
      expect(page).to_not have_content(@show.title)
    end
    scenario 'I click delete on the show index page and it takes me back to the Show index' do
      visit admin_shows_path

      save_and_open_page
      find("#destroy-show-#{@show.id}").click

      expect(current_path).to eq(admin_shows_path)
      expect(page).to_not have_content(@show.title)
    end
  end
end
