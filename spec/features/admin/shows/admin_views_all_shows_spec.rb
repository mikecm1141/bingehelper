require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/shows' do
    before(:each) do
      @show1 = Show.create!(title: 'Futurama')
      @show2 = Show.create!(title: 'The Simpsons')
      @show3 = Show.create!(title: 'Seinfeld')
    end
    scenario 'I see a list of all shows' do
      visit admin_shows_path

      expect(page).to have_content(@show1.title)
      expect(page).to have_content(@show2.title)
      expect(page).to have_content(@show3.title)
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
