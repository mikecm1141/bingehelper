require 'rails_helper'

describe 'As a user' do
  before(:each) do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
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

      fill_in :user_password,              with: 'pass2'
      fill_in :user_password_confirmation, with: 'pass2'
      click_on 'Change Password'

      expect(current_path).to eq(settings_user_path(@user))
      expect(page).to have_content('Password changed successfully.')
    end
    scenario 'As user cannot access someone elses settings page' do
      user2 = create(:user)
      visit settings_user_path(user2)

      expect(current_path).to eq(root_path)
      expect(page).to have_content('You are not authorized to view that page.')
    end
    scenario 'As user cannot access someone elses change password page' do
      user2 = create(:user)
      visit settings_user_path(user2)

      expect(current_path).to eq(root_path)
      expect(page).to have_content('You are not authorized to view that page.')
    end
  end
end
describe 'As a visitor' do
  before(:each) do
    @user = create(:user)
  end
  describe 'I cannot see these pages until logged in' do
    it 'sends me back to the login page with an error message' do
      visit settings_user_path(@user)

      expect(current_path).to eq(login_path)
    end
  end
end
