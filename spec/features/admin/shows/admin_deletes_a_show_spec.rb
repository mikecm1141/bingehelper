require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    @admin_user = User.create!(name: 'Mike', email: 'mikecm@gmail.com', password: 'password', password_confirmation: 'password', admin: true)

    visit login_path

    fill_in :login_email, with: @admin_user.email
    fill_in :login_password, with: @admin_user.password
    click_on 'Login'
  end
  describe 'when I want to delete a show' do
    before(:each) do
      @show = Show.create!(title: 'Futurama')
    end
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
