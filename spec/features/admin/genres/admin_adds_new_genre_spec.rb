require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  describe 'when I visit /admin/genres/new' do
    scenario 'I fill out the genre form and add a new genre' do
      visit new_admin_genre_path

      fill_in :genre_title, with: 'Comedy'
      click_on 'Create Genre'

      expect(current_path).to eq('/admin/genres')
      expect(page).to have_content('Comedy')
    end
    scenario 'I try to add a genre which already exists' do
      genre = create(:genre)

      visit new_admin_genre_path

      fill_in :genre_title, with: genre.title
      click_on 'Create Genre'

      expect(current_path).to eq('/admin/genres/new')
      expect(page).to have_content('Title has already been taken')
    end
    scenario 'I try to add a genre with no type' do
      visit new_admin_genre_path

      fill_in :genre_title, with: ''
      click_on 'Create Genre'

      expect(current_path).to eq ('/admin/genres/new')
      expect(page).to have_content('Title can\'t be blank')
    end
  end
end
