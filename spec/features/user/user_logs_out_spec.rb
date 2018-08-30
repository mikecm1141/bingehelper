require 'rails_helper'

describe 'As a user' do
  describe 'when I click Log Out, I am logged out' do
    scenario 'I click log out from any page' do
      user = User.create!(name: 'Mike', email: 'mikecm@gmail.com', password: 'password', password_confirmation: 'password')
      visit login_path

      fill_in :login_email, with: user.email
      fill_in :login_password, with: user.password
      click_on 'Login'

      visit root_path

      find("#desktop-log-out").click

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Logged out.')
    end
  end
end
