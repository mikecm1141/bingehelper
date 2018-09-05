require 'rails_helper'

describe 'As any kind of user' do
  describe 'when I visit the root page' do
    it 'displays a list of the most rated shows' do
      show1, show2, show3, show4, show5 = create_list(:show, 5)

      8.times { show1.ratings << create(:rating) }
      6.times { show2.ratings << create(:rating) }
      4.times { show3.ratings << create(:rating) }
      2.times { show4.ratings << create(:rating) }
      2.times { show5.ratings << create(:rating) }
      visit root_path

      within("#most-rated-shows") do
        expect(page).to have_content("#{show1.title} (#{show1.year}) #{show1.total_ratings} user ratings")
        expect(page).to have_content("#{show2.title} (#{show2.year}) #{show2.total_ratings} user ratings")
        expect(page).to have_content("#{show3.title} (#{show3.year}) #{show3.total_ratings} user ratings")
        expect(page).to have_content("#{show4.title} (#{show4.year}) #{show4.total_ratings} user ratings")
        expect(page).to have_content("#{show5.title} (#{show5.year}) #{show5.total_ratings} user ratings")
      end
    end
    it 'displays a list of top shows by user score' do
      show1, show2, show3, show4, show5 = create_list(:show, 5)
      show1.ratings << create(:rating, score: 8)
      show2.ratings << create(:rating, score: 10)
      show3.ratings << create(:rating, score: 6)
      show4.ratings << create(:rating, score: 7)
      show5.ratings << create(:rating, score: 4)

      visit root_path

      within("#top-shows-by-score") do
        expect(page).to have_content("#{show1.title} (#{show1.year}) #{show1.avg_score}/10")
        expect(page).to have_content("#{show2.title} (#{show2.year}) #{show2.avg_score}/10")
        expect(page).to have_content("#{show3.title} (#{show3.year}) #{show3.avg_score}/10")
        expect(page).to have_content("#{show4.title} (#{show4.year}) #{show4.avg_score}/10")
        expect(page).to have_content("#{show5.title} (#{show5.year}) #{show5.avg_score}/10")
      end
    end
    it 'displays a list of top shows by user score' do
      show1, show2, show3, show4, show5 = create_list(:show, 5)
      show1.ratings << create(:rating, bingecount: 8)
      show2.ratings << create(:rating, bingecount: 10)
      show3.ratings << create(:rating, bingecount: 6)
      show4.ratings << create(:rating, bingecount: 7)
      show5.ratings << create(:rating, bingecount: 4)

      visit root_path

      within("#top-shows-by-bingecount") do
        expect(page).to have_content("#{show1.title} (#{show1.year}) #{show1.avg_bingecount} episodes")
        expect(page).to have_content("#{show2.title} (#{show2.year}) #{show2.avg_bingecount} episodes")
        expect(page).to have_content("#{show3.title} (#{show3.year}) #{show3.avg_bingecount} episodes")
        expect(page).to have_content("#{show4.title} (#{show4.year}) #{show4.avg_bingecount} episodes")
        expect(page).to have_content("#{show5.title} (#{show5.year}) #{show5.avg_bingecount} episodes")
      end
    end
  end
end
