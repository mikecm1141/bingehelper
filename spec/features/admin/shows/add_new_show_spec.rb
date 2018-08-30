require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/shows/new' do
    scenario 'I fill out the new show form and see the show page' do
      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      click_on 'Create Show'

      expect(current_path).to eq(admin_show_path(Show.last.id))
      expect(page).to have_content('Futurama')
    end
    scenario 'I enter a non-unique title and see a failure message' do
      Show.create!(title: 'Futurama')

      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      click_on 'Create Show'

      expect(current_path).to eq(new_admin_show_path)
      expect(page).to have_content('Title has already been taken')
    end
    scenario 'I enter no title and see a failure message' do
      visit new_admin_show_path

      click_on 'Create Show'

      expect(current_path).to eq(new_admin_show_path)
      expect(page).to have_content('Title can\'t be blank')
    end
  end
end
