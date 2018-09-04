require 'rails_helper'

describe 'As a user' do
  describe 'When I visit my user page' do
    before(:each) do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      @show1, @show2, @show3 = create_list(:show, 3)
      @rating1 = @show1.ratings << create(:rating, user: @user)
      @rating2 = @show2.ratings << create(:rating, user: @user)
      @rating3 = @show3.ratings << create(:rating, user: @user)
    end
    scenario 'I see a list of all shows I have rated' do
      visit user_path(@user)

      expect(page).to have_content(@show1.title)
      within("#rating-score-id-#{@rating1.first.id}") do
        expect(page).to have_content(@rating1.first.score)
      end
      within("#rating-bingecount-id-#{@rating1.first.id}") do
        expect(page).to have_content(@rating1.first.bingecount)
      end

      expect(page).to have_content(@show2.title)
      within("#rating-score-id-#{@rating2.first.id}") do
        expect(page).to have_content(@rating2.first.score)
      end
      within("#rating-bingecount-id-#{@rating2.first.id}") do
        expect(page).to have_content(@rating2.first.bingecount)
      end

      expect(page).to have_content(@show3.title)
      within("#rating-score-id-#{@rating3.first.id}") do
        expect(page).to have_content(@rating3.first.score)
      end
      within("#rating-bingecount-id-#{@rating3.first.id}") do
        expect(page).to have_content(@rating3.first.bingecount)
      end
    end
  end
end
