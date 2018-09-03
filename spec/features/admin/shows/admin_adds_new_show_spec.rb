require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  describe 'when I visit /admin/shows/new' do
    scenario 'I fill out the new show form and see the show page' do
      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      select '2002', from: :show_year
      fill_in :show_runtime, with: '60'
      click_on 'Create Show'

      expect(current_path).to eq(admin_shows_path)
      expect(page).to have_content('Futurama')
    end
    scenario 'I enter a non-unique title and see a failure message' do
      song = create(:show, title: 'Futurama')

      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      select '2002', from: :show_year
      fill_in :show_runtime, with: '22'
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
    scenario 'I enter no runtime and see a failure message' do
      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      select '2002', from: :show_year
      click_on 'Create Show'

      expect(current_path).to eq(new_admin_show_path)
      expect(page).to have_content('Runtime can\'t be blank')
    end
    scenario 'I enter a negative runtime and see a failure message' do
      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      select '2002', from: :show_year
      fill_in :show_runtime, with: '-22'
      click_on 'Create Show'

      expect(current_path).to eq(new_admin_show_path)
      expect(page).to have_content('Runtime must be greater than 0')
    end
  end
end
