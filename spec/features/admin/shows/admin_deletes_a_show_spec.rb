require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = User.create!(name: 'Admin', email: 'admin', password: 'admin', password_confirmation: 'admin', admin: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    @show = create(:show)
  end
  describe 'when I want to delete a show' do
    scenario 'I click delete on a show page and it takes me to the Show index' do
      visit admin_show_path(@show)

      click_link 'Delete'

      expect(current_path).to eq(admin_shows_path)
      expect(page).to_not have_content(@show.title)
    end
    scenario 'I click delete on the show index page and it takes me back to the Show index' do
      visit admin_shows_path

      find("#destroy-show-#{@show.id}").click

      expect(current_path).to eq(admin_shows_path)
      expect(page).to_not have_content(@show.title)
    end
  end
end
