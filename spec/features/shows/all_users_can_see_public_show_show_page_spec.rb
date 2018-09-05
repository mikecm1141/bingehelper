require 'rails_helper'

describe 'As any type of user' do
  describe 'When I visit /shows/:id' do
    scenario 'I see all the shows information' do
      show = create(:show)

      visit show_path(show)

      expect(page).to have_content(show.title)
      expect(page).to have_content(show.year)
      expect(page).to have_content("Episode Runtime: #{show.runtime} minutes")
      expect(page).to have_content(show.overview)
    end
  end
end
