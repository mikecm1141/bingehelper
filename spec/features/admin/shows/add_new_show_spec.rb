require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/shows/new' do
    scenario 'I fill out the show form and see the show page' do
      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      click_on 'Create Show'

      expect(current_path).to eq("/admin/shows/#{Show.last.id}")
      expect(page).to have_content('Futurama')
    end
  end
end
