require 'rails_helper'

describe 'As any kind of user' do
  describe 'when I visit the root page' do
    before(:each) do
      @show1, @show2, @show3, @show4, @show5 = create_list(:show, 5)

      8.times { @show1.ratings << create(:rating) }
      6.times { @show2.ratings << create(:rating) }
      4.times { @show3.ratings << create(:rating) }
      2.times { @show4.ratings << create(:rating) }
      2.times { @show5.ratings << create(:rating) }
    end
    it 'displays a list of the most rated shows' do
      visit root_path

      within("#most-rated-shows") do
        expect(page).to have_content("#{@show1.title} (#{@show1.year}) - #{@show1.total_ratings} user ratings")
        expect(page).to have_content("#{@show2.title} (#{@show2.year}) - #{@show2.total_ratings} user ratings")
        expect(page).to have_content("#{@show3.title} (#{@show3.year}) - #{@show3.total_ratings} user ratings")
        expect(page).to have_content("#{@show4.title} (#{@show4.year}) - #{@show4.total_ratings} user ratings")
        expect(page).to have_content("#{@show5.title} (#{@show5.year}) - #{@show5.total_ratings} user ratings")
      end
    end
  end
end
