require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/show/:id/edit' do
    scenario 'I can edit a show and see its updated show page' do
      show = Show.create(title: 'Futurama')

      visit edit_admin_show_path(show)

      fill_in :show_title, with: 'The Simpsons'
      click_on 'Update Show'

      expect(current_path).to eq(admin_show_path(show))
      expect(page).to have_content('The Simpsons')
    end
  end
end
