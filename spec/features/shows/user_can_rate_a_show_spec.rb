require 'rails_helper'

describe 'As a user' do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    @show = create(:show)
  end
  describe 'when I visit a show page' do
    it 'allows me to review a show and add a watch count' do
      visit show_path(@show)

      select '8', from: :rating_score
      select '4', from: :rating_bingecount
      click_on 'Add Rating'

      expect(current_path).to eq(show_path(@show))
      within("#stats-user-#{user.id}") do
        expect(page).to have_content("Your Rating: #{user.score(@show)}")
        expect(page).to have_content("Your BingeCount: #{user.bingecount(@show)}")
        expect(page).to have_content("Your BingeScore: #{user.bingescore(@show)}")
      end

      within("#stats-all") do
        expect(page).to have_content("Average Rating: #{@show.score}")
        expect(page).to have_content("Average BingeCount: #{@show.bingecount}")
        expect(page).to have_content("BingeScore: #{@show.bingescore}")
      end
    end
  end
end
