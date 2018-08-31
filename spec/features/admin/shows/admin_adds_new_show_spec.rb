require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    @admin_user = User.create!(name: 'Mike', email: 'mikecm@gmail.com', password: 'password', password_confirmation: 'password', admin: true)

    visit login_path

    fill_in :login_email, with: @admin_user.email
    fill_in :login_password, with: @admin_user.password
    click_on 'Login'
  end
  describe 'when I visit /admin/shows/new' do
    scenario 'I fill out the new show form and see the show page' do
      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      select '2002', from: :show_year
      click_on 'Create Show'

      expect(current_path).to eq(admin_shows_path)
      expect(page).to have_content('Futurama')
    end
    scenario 'I enter a non-unique title and see a failure message' do
      Show.create!(title: 'Futurama', year: 2002)

      visit new_admin_show_path

      fill_in :show_title, with: 'Futurama'
      select '2002', from: :show_year
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
