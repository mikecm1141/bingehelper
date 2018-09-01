require 'rails_helper'

describe 'As a user' do
  describe 'when I click Log Out, I am logged out' do
    scenario 'I click log out from any page' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      find("#desktop-log-out").click

      save_and_open_page

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Logged out.')
    end
  end
end
