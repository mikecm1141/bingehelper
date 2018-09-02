require 'rails_helper'

describe 'As a visitor or user' do
  describe 'when I visit /shows' do
    before(:each) do
      @show1, @show2 = create_list(:show, 2)
    end
    scenario 'I see a list of all TV shows' do
      visit shows_path

      expect(page).to have_content(@show1.title)
      within("#show-year-id-#{@show1.id}") do
        expect(page).to have_content(@show1.year)
      end
      expect(page).to have_content(@show2.title)
      within("#show-year-id-#{@show2.id}") do
        expect(page).to have_content(@show2.year)
      end
    end
    scenario 'I can click on a show title to get to its show page' do
      visit shows_path

      click_link @show1.title

      expect(current_path).to eq(show_path(@show1))
      expect(page).to have_content(@show1.title)
    end
  end
end
