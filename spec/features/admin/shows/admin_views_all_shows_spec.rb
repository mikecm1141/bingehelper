require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = User.create!(name: 'Admin', email: 'admin', password: 'admin', password_confirmation: 'admin', admin: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  describe 'when I visit /admin/shows' do
    before(:each) do
      @show1, @show2, @show3 = create_list(:show, 3)
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
