require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    admin = User.create!(name: 'Admin', email: 'admin', password: 'admin', password_confirmation: 'admin', admin: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  describe 'when I visit /admin/show/:id' do
    before(:each) do
      @show = create(:show)
    end
    scenario 'I see the show details' do
      visit admin_show_path(@show)

      expect(page).to have_content(@show.title)
      expect(page).to have_content(@show.year)
    end
    it 'has links to edit and delete that show' do
      visit admin_show_path(@show)

      expect(page).to have_link('Edit', href: edit_admin_show_path(@show))
      expect(page).to have_link('Delete', href: admin_show_path(@show))
    end
  end
end
