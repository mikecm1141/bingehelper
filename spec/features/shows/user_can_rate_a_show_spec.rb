require 'rails_helper'

describe 'As a user' do
  before(:each) do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @show = create(:show)
  end
  describe 'when I visit a show page' do
    it 'allows me to review a show and add a watch count' do
      visit show_path(@show)

      select '8/10', from: :rating_score
      select '4 episodes', from: :rating_bingecount
      click_on 'Submit Rating'

      expect(current_path).to eq(show_path(@show))
      within("#stats-user-#{@user.id}") do
        expect(page).to have_content("Your Review Score #{@user.score(@show)}")
        expect(page).to have_content("Your BingeCount #{@user.bingecount(@show)}")
        expect(page).to have_content("Your BingeScore #{@user.bingescore(@show)}")
      end
      within("#stats-all") do
        expect(page).to have_content("Total Ratings #{@show.total_ratings}")
        expect(page).to have_content("Average Review Score #{@show.avg_score}")
        expect(page).to have_content("Average BingeCount #{@show.avg_bingecount}")
        expect(page).to have_content("BingeScore #{@show.bingescore}")
      end
    end
    it 'lets me delete my rating to make a new one' do
      @show.ratings << create(:rating, user: @user)

      visit show_path(@show)

      expect(page).to have_content("Your Review Score #{@user.score(@show)}")

      click_link 'Delete Your Rating'

      expect(current_path).to eq(show_path(@show))
      expect(page).to have_content('No rating information for this show yet.')
      expect(page).to_not have_content("Your Review Score")
    end
  end
end
describe 'As a visitor' do
  describe 'when I visist a Show show page' do
    it 'does not display form to rate shows' do
      show = create(:show)
      visit show_path(show)

      expect(page).to_not have_field :rating_score
      expect(page).to_not have_field :rating_bingecount
    end
  end
end
