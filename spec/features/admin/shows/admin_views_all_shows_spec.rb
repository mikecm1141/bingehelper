require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit /admin/shows' do
    scenario 'I see a list of all shows' do
      show1 = Show.create!(title: 'Futurama')
      show2 = Show.create!(title: 'The Simpsons')
      show3 = Show.create!(title: 'Seinfeld')

      visit admin_shows_path

      expect(page).to have_content(show1.title)
      expect(page).to have_content(show2.title)
      expect(page).to have_content(show3.title)
    end
  end
end
