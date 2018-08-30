require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /' do
    scenario 'I fill in account information and create an account' do
      visit root_path

      find("#desktop-sign-up").click

      expect(current_path).to eq new_user_path

      fill_in :user_name, with: 'Mike'
      fill_in :user_email, with: 'mikecm@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Create Account'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Account creation successful.')
    end
    scenario 'I fill in form incorrectly and am given an error message' do
      visit new_user_path

      fill_in :user_name, with: ''
      fill_in :user_email, with: 'mikecm@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'notthesame'
      click_on 'Create Account'

      expect(current_path).to eq(users_path)
      expect(page).to have_content('Password confirmation doesn\'t match Password. Name can\'t be blank')
    end
  end
end
