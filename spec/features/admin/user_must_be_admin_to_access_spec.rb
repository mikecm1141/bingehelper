require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit any administrator pages' do
    it 'redirects to /login and gives me an error message' do
      visit admin_shows_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content('You must be an administrator to access this page.')
    end
  end
end
describe 'As a user' do
  describe 'when I visist any administrator page' do
    it 'redirects to /login and gives me an error message' do
      user = User.create!(name: 'Mike', email: 'mikecm@gmail.com', password: 'password', password_confirmation: 'password')

      visit login_path

      fill_in :login_email, with: user.email
      fill_in :login_password, with: user.password
      click_on 'Login'

      visit admin_shows_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content('You must be an administrator to access this page.')
    end
  end
end
