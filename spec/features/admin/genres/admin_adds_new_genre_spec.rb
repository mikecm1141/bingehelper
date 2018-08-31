require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/genres/new' do
    scenario 'I fill out the genre form and add a new genre' do
      visit '/admin/genres/new'

      fill_in :genre_type, with: 'Comedy'
      click_on 'Create Genre'

      expect(current_path).to eq('/admin/genres')
      expect(page).to have_content('Comedy')
    end
    scenario 'I try to add a genre which already exists' do
      genre = Genre.create!(type: 'Comedy')

      visit '/admin/genres/new'

      fill_in :genre_type, with: genre.type
      click_on 'Create Genre'

      expect(current_path).to eq('/admin/genres/new')
      expect(page).to have_content('Type has already been taken')
    end
    scenario 'I try to add a genre with no type' do
      visit '/admin/genres/new'

      fill_in :genre_type, with: ''
      click_on 'Create Genre'

      expect(current_path).to eq ('/admin/genres/new')
      expect(page).to have_content('Type can\'t be blank')
    end
  end
end
