require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    @genre = Genre.create!(type: 'Comedy')
  end
  describe 'when I visit /admin/genres/1/edit' do
    scenario 'I can edit an existing genre' do
      visit '/admin/genres/1/edit'

      fill_in :genre_type, with: 'Action'
      click_on 'Update Genre'

      expect(current_path).to eq('/admin/genres/1')
      expect(page).to have_content('Action')
    end
    scenario 'It fails when attempting to update with duplicate genre' do
      Genre.create!(type: 'Action')

      visit '/admin/genres/1/edit'

      fill_in :genre_type, with: 'Comedy'
      click_on 'Update Genre'

      expect(current_path).to eq('/admin/genres/1/edit')
      expect(page).to have_content('Type has already been taken')
    end
    scenario 'It fails when attempting to update with no genre' do
      visit '/admin/genres/1/edit'

      fill_in :genre_type, with: ''
      click_on 'Update Genre'

      expect(current_path).to eq('/admin/genres/1/edit')
      expect(page).to have_content('Type can\'t be blank')
    end
  end
end
