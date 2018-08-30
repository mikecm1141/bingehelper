require 'rails_helper'

describe 'As a user' do
  before(:each) do
    @user = User.create!(name: 'Mike', email: 'mikecm@gmail.com', password: 'pass', password_confirmation: 'pass')

    visit login_path

    fill_in :login_email, with: @user.email
    fill_in :login_password, with: @user.password
    click_on 'Login'
  end
  describe 'When I click my email when logged in' do
    scenario 'I see my user information and history page' do
      visit root_path

      find("#desktop-user-link").click

      expect(current_path).to eq(settings_user_path(@user))
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.email)
    end
    scenario 'I can change my password' do
      visit settings_user_path(@user)

      click_link 'Change Password'

      expect(current_path).to eq(edit_settings_user_path(@user))

      fill_in :user_password, with: 'pass2'
      fill_in :user_password_confirmation, with: 'pass2'
      click_on 'Change Password'

      expect(current_path).to eq(settings_user_path(@user))
      expect(page).to have_content('Password changed successfully.')
    end
  end
end
