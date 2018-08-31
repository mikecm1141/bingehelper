require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = User.create!(name: 'Admin', email: 'admin', password: 'admin', password_confirmation: 'admin', admin: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  describe 'when I visit /admin/show/:id/edit' do
    before(:each) do
      @show = Show.create!(title: 'Futurama', year: 2002)
    end
    scenario 'I can edit a show and see its updated show page' do
      visit edit_admin_show_path(@show)

      fill_in :show_title, with: 'The Simpsons'
      click_on 'Update Show'

      expect(current_path).to eq(admin_show_path(@show))
      expect(page).to have_content('The Simpsons')
    end
    scenario 'I update with a non-unique title and see a failure message' do
      show = Show.create!(title: 'The Simpsons', year: 1992)

      visit edit_admin_show_path(show)

      fill_in :show_title, with: 'Futurama'
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
  end
end
