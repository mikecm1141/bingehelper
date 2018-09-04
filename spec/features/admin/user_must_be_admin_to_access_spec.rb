require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit any administrator pages' do
    it 'redirects to /login and gives me an error message' do
      visit admin_shows_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
describe 'As a user' do
  describe 'when I visit any administrator page' do
    it 'redirects to /login and gives me an error message' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_shows_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
