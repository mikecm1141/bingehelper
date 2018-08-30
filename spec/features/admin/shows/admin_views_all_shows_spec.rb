require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    @admin_user = User.create!(name: 'Mike', email: 'mikecm@gmail.com', password: 'password', password_confirmation: 'password', admin: true)

    visit login_path

    fill_in :login_email, with: @admin_user.email
    fill_in :login_password, with: @admin_user.password
    click_on 'Login'
  end
  describe 'when I visit /admin/shows' do
    before(:each) do
      @show1 = Show.create!(title: 'Futurama', year: 2002)
      @show2 = Show.create!(title: 'The Simpsons', year: 1993)
      @show3 = Show.create!(title: 'Seinfeld', year: 1990)
    end
    scenario 'I see a list of all shows' do
      visit admin_shows_path

      expect(page).to have_content(@show1.title)
      within("#year-id-#{@show1.id}") do
        expect(page).to have_content(@show1.year)
      end
      expect(page).to have_content(@show2.title)
      within("#year-id-#{@show2.id}") do
        expect(page).to have_content(@show2.year)
      end
      expect(page).to have_content(@show3.title)
      within("#year-id-#{@show3.id}") do
        expect(page).to have_content(@show3.year)
      end
    end
    scenario 'I click a show title and go to that shows page' do
      visit admin_shows_path

      click_link @show1.title

      expect(current_path).to eq(admin_show_path(@show1))
      expect(page).to have_content(@show1.title)
    end
    scenario 'I click on edit and it takes me to the edit show page' do
      visit admin_shows_path

      find("#edit-show-#{@show1.id}").click

      expect(current_path).to eq(edit_admin_show_path(@show1))
    end
    scenario 'It has a link to delete show' do
      visit admin_shows_path

      expect(page).to have_link('Delete')
    end
  end
end
