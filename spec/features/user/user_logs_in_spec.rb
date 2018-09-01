require 'rails_helper'

describe 'As a user' do
  describe 'When I visit /' do
    before(:each) do
      @user = create(:user)
    end
    scenario 'I click Log In and fill in proper credentials to login successfully' do
      visit login_path

      fill_in :login_email, with: @user.email
      fill_in :login_password, with: @user.password
      click_on 'Login'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Login successful.')
      expect(page).to have_content(@user.email)
    end
    scenario 'I click Log In and give invalid credentials to not login successfully' do
      visit login_path

      fill_in :login_email, with: 'mikecm2@gmail.com'
      fill_in :login_password, with: 'pasword'
      click_on 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Incorrect email or password, try again.')
    end
  end
end
