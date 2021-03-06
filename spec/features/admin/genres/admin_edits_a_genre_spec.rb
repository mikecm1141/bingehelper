require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    @genre = create(:genre, title: 'Comedy')
    admin  = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  describe 'when I visit /admin/genres/1/edit' do
    scenario 'I can edit an existing genre' do
      visit edit_admin_genre_path(@genre)

      fill_in :genre_title, with: 'Action'
      click_on 'Update Genre'

      expect(current_path).to eq(admin_genre_path(@genre))
      expect(page).to have_content('Action')
    end
    scenario 'It fails when attempting to update with duplicate genre' do
      create(:genre, title: 'Action')

      visit edit_admin_genre_path(@genre)

      fill_in :genre_title, with: 'Action'
      click_on 'Update Genre'

      expect(current_path).to eq(edit_admin_genre_path(@genre))
      expect(page).to have_content('Title has already been taken')
    end
    scenario 'It fails when attempting to update with no genre' do
      visit edit_admin_genre_path(@genre)

      fill_in :genre_title, with: ''
      click_on 'Update Genre'

      expect(current_path).to eq(edit_admin_genre_path(@genre))
      expect(page).to have_content('Title can\'t be blank')
    end
  end
end
