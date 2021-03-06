require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    @show = create(:show, title: 'The Simpsons')
  end
  describe 'when I visit /admin/show/:id/edit' do
    before(:each) do
    end
    scenario 'I can edit a show and see its updated show page' do
      visit edit_admin_show_path(@show)

      fill_in :show_title, with: 'The Simpsons'
      fill_in :show_overview, with: 'A funny show.'
      click_on 'Update Show'

      expect(current_path).to eq(admin_show_path(@show))
      expect(page).to have_content('The Simpsons')
    end
    scenario 'I update with a non-unique title and see a failure message' do
      show = create(:show, title: 'Futurama')

      visit edit_admin_show_path(show)

      fill_in :show_title, with: 'The Simpsons'
      select '2002', from: :show_year
      click_on 'Update Show'

      expect(current_path).to eq(edit_admin_show_path(show))
      expect(page).to have_content('Title has already been taken')
    end
    scenario 'I enter no title and see a failure message' do
      visit edit_admin_show_path(@show)

      fill_in :show_title, with: ''
      select '2002', from: :show_year
      click_on 'Update Show'

      expect(current_path).to eq(edit_admin_show_path(@show))
      expect(page).to have_content('Title can\'t be blank')
    end
    scenario 'I update with a negative runtime and see a failure message' do
      show = create(:show, title: 'Futurama')

      visit edit_admin_show_path(show)

      fill_in :show_runtime, with: '-5'
      click_on 'Update Show'

      expect(current_path).to eq(edit_admin_show_path(show))
      expect(page).to have_content('Runtime must be greater than 0')
    end
    scenario 'I update with a floating runtime and see a failure message' do
      show = create(:show, title: 'Futurama')

      visit edit_admin_show_path(show)

      fill_in :show_runtime, with: '2.2'
      click_on 'Update Show'

      expect(current_path).to eq(edit_admin_show_path(show))
      expect(page).to have_content('Runtime must be an integer')
    end
  end
end
