require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    @admin_user = User.create!(name: 'Mike', email: 'mikecm@gmail.com', password: 'password', password_confirmation: 'password', admin: true)

    visit login_path

    fill_in :login_email, with: @admin_user.email
    fill_in :login_password, with: @admin_user.password
    click_on 'Login'
  end
  describe 'when I visit /admin/show/:id/edit' do
    before(:each) do
      @show = Show.create!(title: 'Futurama')
    end
    scenario 'I can edit a show and see its updated show page' do
      visit edit_admin_show_path(@show)

      fill_in :show_title, with: 'The Simpsons'
      click_on 'Update Show'

      expect(current_path).to eq(admin_show_path(@show))
      expect(page).to have_content('The Simpsons')
    end
    scenario 'I update with a non-unique title and see a failure message' do
      show = Show.create!(title: 'The Simpsons')

      visit edit_admin_show_path(show)

      fill_in :show_title, with: 'Futurama'
      click_on 'Update Show'

      expect(current_path).to eq(edit_admin_show_path(show))
      expect(page).to have_content('Title has already been taken')
    end
    scenario 'I enter no title and see a failure message' do
      visit edit_admin_show_path(@show)

      fill_in :show_title, with: ''
      click_on 'Update Show'

      expect(current_path).to eq(edit_admin_show_path(@show))
      expect(page).to have_content('Title can\'t be blank')
    end
  end
end
